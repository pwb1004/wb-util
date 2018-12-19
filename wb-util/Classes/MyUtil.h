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


//判断给定的对象是否为空
+ (BOOL)isNilOrEmpty:(id)string;

//设置视图下一级标题为返回
+ (void)setNextViewControllerBackButtonTitle:(UIViewController *)viewController;

//判断是否有效的手机号码
+ (BOOL)isValidMobile:(NSString *)mobileNum;

+ (BOOL)isValidPhone:(NSString *)phone;

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
+(NSString *)deleteSpaceStr:(NSString *)str;
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

/* 判断是否包含汉字*/
+ (BOOL)isChiese:(NSString *)str;
+ (BOOL)checkProductDate:(NSString *)tempDate;

/**
 *  去掉字符串中的HTML标签
 *
 *  @param html 需要去掉HTML标签的字符串
 *  @param trim 是否需要去掉HTML标签
 *
 *  @return 去掉HTML标签后的字符串
 */
+ (NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim;

/**
 *  判断是否有效的身份证号
 *
 *  @param identityCard 要判断的字符串
 *
 *  @return 是否有效
 */
+ (BOOL)isValidIdentityCard:(NSString *)identityCard;

+ (NSURL *)imageUrlWithString:(NSString *)string;

+ (NSString *)getWeekdayWithDate:(NSDate *)date;

+ (NSString *)getNoneNilString:(id)obj;

+ (NSInteger)getAgeWithDateString:(NSString *)dateString andDateFormate:(NSString *)format;

//获取灰色图片
+ (UIImage*)getGrayImage:(UIImage*)sourceImage;

+ (CLLocationDistance)distanceForLocation:(CLLocation *)location1 toLocation:(CLLocation *)location2;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)selector;

+ (void)showTipText:(NSString *)text;

+ (void)showTipText:(NSString *)text completion:(MBProgressHUDCompletionBlock)block;

+ (BOOL)isValidIdCardNumber:(id)idNumber;

+ (void)showProgressHud;
+ (void)hideProgressHud;

+ (UIImage *)fixOrientationWithImage:(UIImage *)aImage;

+ (UIViewController *)findNearsetViewController:(UIView *)view;

//删除字典里的null值
+ (NSDictionary *)deleteEmpty:(NSDictionary *)dic;

+ (id)getNoneNillObject:(id)obj;

+ (UIBarButtonItem *)backButtonWithTarget:(id)target action:(SEL)selector;
+ (NSString *)dateStringFromObject:(id)object;
+ (void)jumpToLoginWithViewController:(UIViewController *)viewController;
+ (void)showErrorText:(NSString *)text;

+ (void)showErrorText:(NSString *)text completion:(MBProgressHUDCompletionBlock)block;

+ (void)showSuccessText:(NSString *)text;

+ (void)showSuccessText:(NSString *)text completion:(MBProgressHUDCompletionBlock)block;
+ (NSString *)getMd5Password:(NSString *)string;
+ (NSArray *)getConstArrayWithKey:(NSString *)key;
+ (void)goLogin;
+ (NSString *)getIPAddress;
+ (NSDictionary *)getXywyApiConfigWithKey:(NSString *)key;
+ (BOOL)isValidPassword:(NSString *)password;
+ (BOOL)isValidNickname:(NSString *)nickname;
+ (NSString *)getSwitchStatus:(NSInteger)integer;

+ (UIViewController *)getCurrentVC;

/** 计算label的size*/
+ (CGSize)labelSizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize;


/**
 根据标题创建UIActionSheet

 @param titles 标题数组
 @param block index为标题数组的index，取消返回的index为-1
 */
+ (void)showActionSheetWithTitles:(NSArray *)titles completion:(void (^)(NSInteger index))block;

/**
判断是否是表情
yes 是表情
*/
+ (BOOL)isContainsTwoEmoji:(NSString *)string;

/**
 判断是不是九宫格
 @param string  输入的字符
 @return YES(是九宫格拼音键盘)
 */
+ (BOOL)isNineKeyBoard:(NSString *)string;

@end
