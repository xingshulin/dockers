apt-get update -y
apt-get install -y software-properties-common
apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Deps
dpkg --add-architecture i386
apt-get update -y
apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python curl unzip

# Install Android SDK
# Notes -> https://code.google.com/p/android/issues/detail?id=183131&q=subcomponent%3DTools-sdkman%20-has%3Adefect%20label%3Areportedby-developer&colspec=ID%20Status%20Priority%20Owner%20Summary%20Stars%20Reporter%20Opened
sdkDir="$@"
echo "Installing android sdk to ${sdkDir}, current dir is ${PWD}"
mkdir -p "${sdkDir}"
wget https://dl.google.com/android/repository/sdk-tools-darwin-3859397.zip
unzip sdk-tools-darwin-3859397.zip -d "$@"
rm sdk-tools-darwin-3859397.zip
cd "${sdkDir}"
# touch ~/.android/repositories.cfg
echo y | ./tools/bin/sdkmanager "platform-tools"
# enable ndk if needed
# echo y | ./tools/bin/sdkmanager "ndk-bundle" 
echo y | ./tools/bin/sdkmanager "platforms;android-25" "build-tools;25.0.0"
echo y | ./tools/bin/sdkmanager "extras;google;m2repository" "extras;android;m2repository"
# constraint layout need 
echo y | ./tools/bin/sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-beta4"