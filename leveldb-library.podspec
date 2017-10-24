Pod::Spec.new do |s|
  s.name         =  'leveldb-library'
  s.version      =  '1.18.3'
  s.license      =  'New BSD'
  s.summary      =  'A fast key-value storage library '
  s.description  =  'LevelDB is a fast key-value storage library written at Google that provides an ordered mapping from string keys to string values.'
  s.homepage     =  'https://github.com/google/leveldb'
  s.authors      =  'The LevelDB Authors'

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.source       =  { 
    :git => 'https://github.com/matehat/leveldb.git',
    # TODO(wilhuff) Match tag to repo version with :tag => s.version.to_s
    :tag => 'v1.18.1'
  }

  s.requires_arc = false

  s.compiler_flags = '-DOS_MACOSX', '-DLEVELDB_PLATFORM_POSIX'

  s.preserve_path = "db", "port", "table", "util"
  s.xcconfig = {
    'CC'  => 'clang',
    'CXX' => 'clang++',
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/leveldb-library/" "${PODS_ROOT}/leveldb-library/include"',
    # TODO(wilhuff) Fix library warnings introduced with Xcode 8.3 and remove WARNING_CFLAGS option
    'WARNING_CFLAGS' => '-Wno-shorten-64-to-32',
    'OTHER_LDFLAGS' => '-lc++'
  }

  s.header_dir = "leveldb"
  s.source_files = [
    "db/*.{cc}",
    "port/*.{cc}",
    "table/*.{cc}",
    "util/*.{cc}",
    "include/leveldb/*.h"
  ]

  s.exclude_files = [
    "**/*_test.cc",
    "**/*_bench.cc",
    "db/leveldbutil.cc",
    "port/win"
  ]
end