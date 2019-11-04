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

+ (NSString *)stringFromTimeInterval:(NSTimeInterval)timeInterval
{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:SS"];
    return [df stringFromDate:date];
}

+ (NSTimeInterval)timeIntervalFromDateString:(NSString *)string
{
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:SS"];
    NSDate * date = [df dateFromString:string];
    return [date timeIntervalSince1970];
}

+ (NSDate *)getDateWithString:(NSString *)s formatter:(NSString *)formatter
{
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:formatter];
    NSDate * date = [df dateFromString:s];
    return date;
}

@end
