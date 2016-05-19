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
xcrun -log -sdk iphoneos PackageApplication -v "$INPUTDIR/test.app" -o "$OUTPUTDIR/KuaiYouJia.ipa"
if [ ! -z "f4f125aac99b0777c58c1e9d4e3e6138" ] && [ ! -z "244bb8a3f9cea45b9aaa322339f7910f" ]; then
echo ""
echo "***************************"
echo "* Uploading to pgyer  *"
echo "***************************"
curl http://www.pgyer.com/apiv1/app/upload \
-F uKey="f4f125aac99b0777c58c1e9d4e3e6138" \
-F _api_key="244bb8a3f9cea45b9aaa322339f7910f" \
-F file="$OUTPUTDIR/$APP_NAME.ipa"
fi
