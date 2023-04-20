#!/bin/bash

if [ ! -d ${ANDROID_SDK_ROOT}/platforms/android-${API} ]; then
    echo "--- installing android-${API} platform"
    yes | sdkmanager "platforms;android-${API}" > /dev/null
fi
if [ ! -d ${ANDROID_SDK_ROOT}/build-tools/${BUILD_TOOLS_VERSION} ]; then
    echo "--- installing build-tools ${BUILD_TOOLS_VERSION}"
    yes | sdkmanager "build-tools;${BUILD_TOOLS_VERSION}" > /dev/null
fi
if [ ! -d ${ANDROID_SDK_ROOT}/ndk/${NDK_VERSION} ]; then
    echo "--- installing ndk ${NDK_VERSION}"
    yes | sdkmanager "ndk;${NDK_VERSION}" > /dev/null
fi
if [ ! -d ${ANDROID_SDK_ROOT}/cmake/${CMAKE_VERSION} ]; then
    echo "--- installing cmake ${CMAKE_VERSION}"
    yes | sdkmanager "cmake;${CMAKE_VERSION}" > /dev/null
fi

export ANDROID_NDK_ROOT=${ANDROID_SDK_ROOT}/ndk/${NDK_VERSION}
export PATH="${ANDROID_NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64/bin:${PATH}"

# start adb server
adb -a server nodaemon &> /dev/null &

# exec user cmd
exec "$@"
