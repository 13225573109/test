#!/bin/sh
if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  echo "This is a pull request. No deployment will be done."
  exit 0
fi
if [[ "$TRAVIS_BRANCH" != "master" ]]; then
  echo "Testing on a branch other than master. No deployment will be done."
  exit 0
fi
PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/AdHocWildcard.mobileprovision"
INPUTDIR="$PWD/build/Release-iphoneos"
OUTPUTDIR="$PWD/build"
xcrun -log -sdk iphoneos PackageApplication -v "$INPUTDIR/test.app" -o "/$OUTPUTDIR/KuaiYouJia.ipa"
