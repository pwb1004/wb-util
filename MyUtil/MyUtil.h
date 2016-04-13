
#import <UIKit/UIKit.h>

#define SHOW_TIP_TIME           1.2
#define isEmpty(obj)            [MyUtil isNilOrEmpty:obj]
#define getNoneNilString(obj)   [MyUtil getNoneNilStringWithObject:obj]

@interface MyUtil : NSObject

+ (BOOL)isNilOrEmpty:(id)string;

+ (NSString *)getNoneNilStringWithObject:(NSString *)object;

@end
