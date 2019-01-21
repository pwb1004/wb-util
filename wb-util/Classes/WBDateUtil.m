//
//  WBDateUtil.m
//  AFNetworking
//
//  Created by Pang Weibo on 2019/1/21.
//

#import "WBDateUtil.h"

@implementation WBDateUtil

+ (NSString *)getDateStringWithDate:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    return [df stringFromDate:date];
}

+ (NSString *)getWeekdayWithDate:(NSDate *)date
{
    NSString * weekday = @"";
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps;
    NSInteger unitFlags =NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    comps = [calendar components:unitFlags fromDate:date];
    switch (comps.weekday) {
        case 1:
        {
            weekday = @"星期日";
        }
            break;
        case 2:
        {
            weekday = @"星期一";
        }
            break;
        case 3:
        {
            weekday = @"星期二";
        }
            break;
        case 4:
        {
            weekday = @"星期三";
        }
            break;
        case 5:
        {
            weekday = @"星期四";
        }
            break;
        case 6:
        {
            weekday = @"星期五";
        }
            break;
        case 7:
        {
            weekday = @"星期六";
        }
            break;
            
        default:
            break;
    }
    return weekday;
}

@end
