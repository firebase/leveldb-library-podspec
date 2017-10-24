# LevelDB Library podspec

This repository provides a podspec to create a CocoaPod for the LevelDB library.
It currently uses the 1.18.1 tagged version from https://github.com/matehat/leveldb 

## Build Notes

CocoaPods 1.x currently does not support libraries with C++ headers. See
https://github.com/CocoaPods/CocoaPods/issues/5152. The workaround is to use
the 1.2.1.beta.1 with its new option --skip-import-validation.

## Updating the podspec (assuming the library is not changing)

  * Update s.version below to the next semantic version
  * pod spec lint leveldb-library.podspec --skip-import-validation
  * Do pull request
  * pod trunk push leveldb-library.podspec --skip-import-validation  --allow-warnings
