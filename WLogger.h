#import <Foundation/Foundation.h>

@interface WLogger : NSObject
- (instancetype)initWithLogFilePath:(NSString *)logFilePath;
- (void)writeLog:(NSString *)message;
- (NSString *)currentTimestamp;
@end
