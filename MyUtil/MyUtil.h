//
//  MyUtil.h
//  DLD
//
//  Created by Weibo on 14-9-5.
//  Copyright (c) 2014年 Chongqing Institute Of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MBProgressHUD.h>
#import <ifaddrs.h>
#import <arpa/inet.h>

#define SHOW_TIP_TIME           1.2

@interface MyUtil : NSObject

//调节view高度；参数：需要调节的view，需要调节的偏移量，视图的方向
+ (void)transformView:(UIView *)view withOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation;

+ (void)transformView:(UIView *)view upWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation;
+ (void)transformView:(UIView *)view downWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation;

+ (void)transformView:(UIView *)view downWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation completion:(void (^) (BOOL finished))completion;

+ (void)hideKeyboardWithView:(UIView *)view;

//判断给定的对象是否为空
+ (BOOL)isNilOrEmpty:(id)string;

//设置视图下一级标题为返回
+ (void)setNextViewControllerBackButtonTitle:(UIViewController *)viewController;

//判断是否有效的手机号码
+ (BOOL)isValidMobile:(NSString *)mobileNum;

+ (BOOL)isValidEmail:(NSString *)email;

+ (BOOL)isValidPlate:(NSString *)plate;

+ (NSDate *)getTodayMidNightTimeInterval;

+ (void)saveObject:(id)object forKey:(NSString *)key;

+ (id)getObjectForKey:(NSString *)key;

+ (void)saveBool:(BOOL)yesOrNo forKey:(NSString *)key;

+ (BOOL)getBoolForKey:(NSString *)key;

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

+ (NSString *)getOrderStatusWithValue:(id)value;

/**
 *  去掉字符串中的HTML标签
 *
 *  @param html 需要去掉HTML标签的字符串
 *  @param trim 是否需要去掉HTML标签
 *
 *  @return 去掉HTML标签后的字符串
 */
+(NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim;

+ (id)getNoneNillObject:(id)obj;

+ (UIBarButtonItem *)backButtonWithTarget:(id)target action:(SEL)selector;

+ (id)generateSaveObjectWithDictionary:(NSDictionary *)dict;

/**
 *  判断是否有效的身份证号
 *
 *  @param identityCard 要判断的字符串
 *
 *  @return 是否有效
 */
+ (BOOL)isValidIdentityCard:(NSString *)identityCard;

+ (NSString *)dateStringFromObject:(id)object;

+ (NSString *)getMarriageStateWithObject:(id)obj;

+ (NSURL *)imageUrlWithString:(NSString *)string;
//获取测评图片地址
+ (NSURL *)testImageUrlWithString:(NSString *)string;
//提示框
+ (void)showTextWithView:(UIView*)view Text:(NSString*)text;
//保存到本地
+ (void) saveCenterProValue:(NSString*)valueStr key:(NSString *)keyStr;
+ (id)getCenterPro:(NSString*)identifier;
//转换时间
+(NSString *)getDate:(NSString *)str;
//转换生日

+(NSString *)getBirthday:(NSString *)str;

+ (NSInteger)getAgeWithTimeStamp:(NSTimeInterval)timeInterval;

+ (NSString *)getPhoneReserveStateStringWithState:(id)state;

+ (NSString *)getOnDoorReserveStateStringWithState:(id)state;

+ (NSString *)getWeekdayWithDate:(NSDate *)date;

+ (NSString *)getNoneNilString:(id)obj;

+ (NSString *)getLevelWithId:(id)levelId;

+ (void)jumpToLoginIfNeededWithViewController:(UIViewController *)viewController responseObject:(id)obj;

+ (NSInteger)getAgeWithDateString:(NSString *)dateString andDateFormate:(NSString *)format;

+ (void)jumpToLoginWithViewController:(UIViewController *)viewController;

+ (NSString *)getCertificateName:(NSDictionary *)dict;
//删掉空格
+(NSString *)deleteSpaceStr:(NSString *)str;

//获取灰色图片
+ (UIImage*)getGrayImage:(UIImage*)sourceImage;

+ (NSString *)dateStringForDiscoveryWithString:(NSString *)string;

+ (CLLocationDistance)distanceForLocation:(CLLocation *)location1 toLocation:(CLLocation *)location2;

+ (NSString *)distanceWithLnt:(id)lat andLng:(id)lng withCity:(NSString *)city;


+ (void)jumpToMyCenterWithViewController:(UIViewController *)viewController;

+ (void)showAlertText:(NSString *)text;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)selector;

+ (void)showAlertWithText:(NSString *)text isForSuccess:(BOOL)isForSuccess completion:(MBProgressHUDCompletionBlock)block;

+ (void)showErrorText:(NSString *)text;

+ (void)showErrorText:(NSString *)text completion:(MBProgressHUDCompletionBlock)block;

+ (void)showSuccessText:(NSString *)text;

+ (void)showSuccessText:(NSString *)text completion:(MBProgressHUDCompletionBlock)block;

+ (void)showTipText:(NSString *)text;

+ (void)showTipText:(NSString *)text completion:(MBProgressHUDCompletionBlock)block;

+ (NSString *)getMd5Password:(NSString *)string;

+ (NSString *)getJobTitleWithId:(id)jobtitleId;

+ (NSArray *)getOfficeTypeWithKey:(NSString *)key key1:(NSString *)key1;

+ (BOOL)isValidIdCardNumber:(id)idNumber;

+ (NSArray *)getConstArrayWithKey:(NSString *)key;

+ (void)showProgressHud;
+ (void)hideProgressHud;

+ (void)goLogin;

+ (NSString *)getDeseaseTypeWithId:(id)typeId;

+ (UIImage *)fixOrientationWithImage:(UIImage *)aImage;

+ (NSString *)getShouZhenDisplayStringWithText:(NSString *)text;

+ (NSString *)getIPAddress;

+ (NSDictionary *)getXywyApiConfigWithKey:(NSString *)key;

@end
