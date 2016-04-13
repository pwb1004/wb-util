
#import "MyUtil.h"
#import "MBProgressHUD.h"

@implementation MyUtil

+ (BOOL)isNilOrEmpty:(id)string
{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] && [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] && ([string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"])) {
        return YES;
    }
    return NO;
}
+ (NSString *)getNoneNilStringWithObject:(NSString *)object
{
    NSString * string = @"";
    if (![object isKindOfClass:[NSNull class]]) {
        string = [NSString stringWithFormat:@"%@", object];
    }
    if (object == nil) {
        string = @"";
    }
    if ([object isKindOfClass:[NSString class]] && [object isEqualToString:@"null"]) {
        string = @"";
    }
    return string;
}

@end
