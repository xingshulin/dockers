apt-get update -y
apt-get install -y software-properties-common
apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Deps
dpkg --add-architecture i386
apt-get update -y
apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python curl

# Install Android SDK
# Notes -> https://code.google.com/p/android/issues/detail?id=183131&q=subcomponent%3DTools-sdkman%20-has%3Adefect%20label%3Areportedby-developer&colspec=ID%20Status%20Priority%20Owner%20Summary%20Stars%20Reporter%20Opened
sdkDir="$@"
echo "Installing android sdk to ${sdkDir}, current dir is ${PWD}"
mkdir -p "${sdkDir}"
wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar xzf android-sdk_r24.4.1-linux.tgz --strip-components 1 -C "$@"
rm android-sdk_r24.4.1-linux.tgz
cd "${sdkDir}"
echo y | ./tools/android -s update sdk --no-ui --filter platform-tools,tools -a
echo y | ./tools/android -s update sdk --no-ui --filter extra-android-m2repository,extra-android-support,extra-google-google_play_services,extra-google-m2repository -a
echo y | ./tools/android -s update sdk --no-ui --filter build-tools-25.0.2,build-tools-24.0.3,build-tools-23.0.3,android-25,android-24,android-23,android-22,android-21 -a
