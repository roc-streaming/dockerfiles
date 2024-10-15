#!/usr/bin/env python3

import argparse
import os
import os.path
import platform
import subprocess
import sys

DRY_RUN = False

def print_msg(msg):
    if platform.system() != 'Windows':
        print(f'-- \033[1;35m{msg}\033[0m', file=sys.stderr)
    else:
        print(msg, file=sys.stderr)

def print_cmd(cmd):
    if not isinstance(cmd, (list, tuple)):
        cmd = [cmd]
    print(f"-- {' '.join(cmd)}", file=sys.stderr)

def run_cmd(*args):
    print_cmd(args)
    if not DRY_RUN:
        subprocess.check_call(args)

parser = argparse.ArgumentParser()
parser.add_argument('-n', '--dry-run', action='store_true', help="don't run commands, just print them")
parser.add_argument('-p', '--push', action='store_true', help="push image after building")
parser.add_argument('-C', '--no-cache', action='store_true', help="pass --no-cache to docker build")
parser.add_argument('-P', '--no-pull', action='store_true', help="don't pass --pull to docker build")
parser.add_argument('--cache-from', type=str, help="from where to load buildx cache")
parser.add_argument('--cache-to', type=str, help="to where to save buildx cache")
parser.add_argument('image', nargs='*', default=None)

args = parser.parse_args()

DRY_RUN = args.dry_run

os.chdir(os.path.dirname(__file__))

if args.image:
    images = args.image
else:
    images = sorted(os.listdir('images'))

for image in images:
    if ':' in image:
        image_shortname, image_tag = image.split(':')
    else:
        image_shortname = image
        image_tag = ''

    image_fullname = f'rocstreaming/{image_shortname}'
    image_dir = f'images/{image_shortname}'

    os.chdir(image_dir)

    with open('images.csv') as fp:
        for n, line in enumerate(fp.readlines()):
            if n == 0:
                continue
            parts = line.strip().split(';')
            if len(parts) == 4:
                dockerfile, build_args, tag, osname = parts
            else:
                dockerfile, build_args, tag = parts
                osname = 'linux'

            if not dockerfile:
                dockerfile = 'Dockerfile'
            if not tag:
                tag = dockerfile.split('/')[0]

            if '/' in dockerfile:
                context = dockerfile.split('/')[0]
            else:
                context = '.'

            if image_tag and tag != image_tag:
                continue
            if osname != platform.system().lower():
                continue

            print_msg(f'processing image {image_fullname}:{tag}')
            print_cmd(f'cd {image_dir}')

            if platform.system() != 'Windows':
                docker_args = ['buildx', 'build', '--output', 'type=docker']
            else:
                docker_args = ['build']

            if not args.no_pull:
                docker_args += ['--pull']
            if args.no_cache:
                docker_args += ['--no-cache']
            else:
                if args.cache_from and os.path.exists(os.path.join(args.cache_from, 'index.json')):
                    docker_args += ['--cache-from', f'type=local,src={args.cache_from}']
                if args.cache_to:
                    if not DRY_RUN:
                        os.makedirs(args.cache_to, exist_ok=True)
                    docker_args += ['--cache-to', f'type=local,dest={args.cache_to}']

            docker_args += [
                '-f', dockerfile,
                '-t', f'{image_fullname}:{tag}',
            ]

            if build_args:
                for arg in build_args.split(','):
                    docker_args += ['--build-arg', arg.replace(' ', '_')]

            docker_args += [context]

            run_cmd('docker', *docker_args)

            if args.push:
                run_cmd('docker', 'push', f'{image_fullname}:{tag}')

    os.chdir('../..')
