#import "WLogger.h"

@interface WLogger ()
@property(nonatomic, strong) NSString *logFilePath;
@end

@implementation WLogger

- (instancetype)initWithLogFilePath:(NSString *)logFilePath {
  self = [super init];
  if (self) {
    _logFilePath = [logFilePath copy];
  }
  return self;
}

- (NSString *)currentTimestamp {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  NSString *timestamp = [dateFormatter stringFromDate:[NSDate date]];
  return timestamp;
}

- (void)writeLog:(NSString *)message {
  NSFileManager *fileManager = [NSFileManager defaultManager];
  BOOL fileExists = [fileManager fileExistsAtPath:self.logFilePath];

  if (!fileExists) {
    NSString *directoryPath =
        [self.logFilePath stringByDeletingLastPathComponent];
    NSError *error = nil;
    if (![fileManager fileExistsAtPath:directoryPath]) {
      [fileManager createDirectoryAtPath:directoryPath
             withIntermediateDirectories:YES
                              attributes:nil
                                   error:&error];
      if (error) {
        NSLog(@"Error creating directory: %@", error.localizedDescription);
        return;
      }
    }
    [fileManager createFileAtPath:self.logFilePath contents:nil attributes:nil];
  }
  NSFileHandle *fileHandle =
      [NSFileHandle fileHandleForWritingAtPath:self.logFilePath];
  if (fileHandle) {
    [fileHandle seekToEndOfFile];
    NSString *logMessage = [NSString stringWithFormat:@"%@\n", message];
    NSData *logData = [logMessage dataUsingEncoding:NSUTF8StringEncoding];
    [fileHandle writeData:logData];
    [fileHandle closeFile];
  } else {
    NSLog(@"Failed to open file for writing.");
  }
}
@end
