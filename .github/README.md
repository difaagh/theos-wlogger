# Simple library for theos to write logs to file

## Install to theos and build .deb

clone this repo

```bash
git clone https://github.com/difaagh/theos-wlogger.git
cd theos-wlogger
make package
```

or `make package THEOS_PACKAGE_SCHEME=roothide` or `make package THEOS_PACKAGE_SCHEME=rootless`

## Usage

```objc
#import <roothide.h>
#import <WLogger.h>
.....
WLogger *logger = [[WLogger alloc] initWithLogFilePath:jbroot(@"/path/to/your/logfile.log")]];
[logger writeLog:@"Hello World!"];
.....
```

## Install from repo

available from my repo https://difaagh.github.io/repo
