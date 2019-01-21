//
//  MyUtil.h
//  Utils
//
//  Created by Pang Weibo on 16-08-21.
//  Copyright (c) 2016年 Pang Weibo All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MBProgressHUD.h"
#import <ifaddrs.h>
#import <arpa/inet.h>

#define SHOW_TIP_TIME           2

@interface MyUtil : NSObject

/**
 判断给定的对象是否为空
 @param string 给定的对象
 @return 是否为空
 */
+ (BOOL)isNilOrEmpty:(id)string;

/**
 判断给定的字符串是否为有效的身份证号码
 @param idNumber 给定的字符串
 @return 是否为有效的身份证号码
 */
+ (BOOL)isValidIdCardNumber:(id)idNumber;

/**
 判断是否有效的手机号码
 @param mobileNum 要判断的手机号码
 @return 是否为有效的手机号码
 */
+ (BOOL)isValidMobile:(NSString *)mobileNum;

+ (BOOL)isValidEmail:(NSString *)email;

+ (BOOL)isValidPlate:(NSString *)plate;

+ (void)saveObject:(id)object forKey:(NSString *)key;

+ (id)getObjectForKey:(NSString *)key;

+ (void)saveBool:(BOOL)yesOrNo forKey:(NSString *)key;

+ (BOOL)getBoolForKey:(NSString *)key;

+ (void)saveDouble:(double)number forKey:(NSString *)key;

+ (double)getDoubleForKey:(NSString *)key;

+ (void)saveInteger:(NSInteger)number forKey:(NSString *)key;

+ (NSInteger)getIntegerForKey:(NSString *)key;

/**
 *  @Author Pang Weibo, 14-12-26 09:12
 *
 *  通过Storyboard Name和Identifier获取视图
 *
 *  @param identifier     identifier
 *  @param storyboardName storyboard name
 *
 *  @return 对应的视图
 */
+ (id)getViewControllerWithIdentifier:(NSString *)identifier storyboardName:(NSString *)storyboardName;

/**
 *  去掉字符串中的HTML标签
 *
 *  @param html 需要去掉HTML标签的字符串
 *  @param trim 是否需要去掉HTML标签
 *
 *  @return 去掉HTML标签后的字符串
 */
+ (NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim;

+ (NSURL *)imageURLWithString:(NSString *)string;

+ (NSString *)getNoneNilString:(id)obj;

//获取灰色图片
+ (UIImage*)getGrayImage:(UIImage*)sourceImage;

+ (CLLocationDistance)distanceForLocation:(CLLocation *)location1 toLocation:(CLLocation *)location2;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)selector;

+ (void)showTipText:(NSString *)text;

+ (void)showTipText:(NSString *)text completion:(MBProgressHUDCompletionBlock)block;

+ (void)showProgressHud;

+ (void)hideProgressHud;

+ (UIImage *)fixOrientationWithImage:(UIImage *)aImage;

//删除字典里的null值
+ (NSDictionary *)deleteEmpty:(NSDictionary *)dic;

+ (NSArray *)deleteEmptyArr:(NSArray *)arr;

+ (NSString *)getIPAddress;

+ (UIViewController *)getCurrentVC;

/**
 获取设备UUID for Vendor
 @return 设备UUIDString
 */
+ (NSString *)getDeviceUUID;

/**
 获取去掉首尾空格和换行符的字符串
 @param s 要处理的字符串
 @return 去掉首尾空格和换行符的字符串
 */
+ (NSString *)getTrimString:(NSString *)s;

+ (void)showAlert:(NSString *)msg;

+ (void)showAlertWithTitle:(NSString *)title withMessage:(NSString *)msg;

@end
