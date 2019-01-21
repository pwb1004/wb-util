//
//  WBDateUtil.h
//  AFNetworking
//
//  Created by Pang Weibo on 2019/1/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WBDateUtil : NSObject

/**
 通过NSDate对象获取格式化的字符串
 @param date 日期对象
 @param format 字符串格式
 @return 格式化后的日期字符串
 */
+ (NSString *)getDateStringWithDate:(NSDate *)date format:(NSString *)format;

/**
 通过NSDate对象获取星期
 @param date 日期对象
 @return 格式化后的日期字符串
 */
+ (NSString *)getWeekdayWithDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
