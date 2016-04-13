//
//  MyUtil.m
//  DLD
//
//  Created by Weibo on 14-9-5.
//  Copyright (c) 2014年 Chongqing Institute Of Engineering. All rights reserved.
//

#import "MyUtil.h"
#import "constant.h"
#import "NSString+MD5.h"
#import "HudView.h"

@implementation MyUtil

+ (void)transformView:(UIView *)view withOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation
{
    CGFloat navigationBarOffset = oreintation == 1 ? 0 : 12;
    
    CGRect frame = view.frame;
    if (frame.origin.y < 0) {
        frame.origin.y += offset + navigationBarOffset;
    }else{
        frame.origin.y -= offset + navigationBarOffset;
    }
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = frame;
    }];
    
}

+ (void)transformView:(UIView *)view upWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation
{
    CGFloat navigationBarOffset = oreintation == 1 ? 0 : 12;
    CGRect frame = view.frame;
    if (frame.origin.y < 0) {
        return ;
    }else{
        frame.origin.y -= offset + navigationBarOffset;
    }
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = frame;
    }];
}

+ (void)transformView:(UIView *)view downWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation
{
    CGFloat navigationBarOffset = oreintation == 1 ? 0 : 12;
    
    CGRect frame = view.frame;
    if (frame.origin.y < 0) {
        frame.origin.y += offset + navigationBarOffset;
    }
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = frame;
    }];
}

+ (void)transformView:(UIView *)view downWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation completion:(void (^)(BOOL finished))completion
{
    CGFloat navigationBarOffset = oreintation == 1 ? 0 : 12;
    
    CGRect frame = view.frame;
    if (frame.origin.y < 0) {
        frame.origin.y += offset + navigationBarOffset;
    }
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = frame;
    } completion:completion];
}

+ (void)hideKeyboardWithView:(UIView *)view
{
    [view endEditing:YES];
}

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

+ (void)setNextViewControllerBackButtonTitle:(UIViewController *)viewController
{
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
}

+ (BOOL)isValidMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1\\d{10}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[0-9]|7[0-9])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isValidEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)isValidPlate:(NSString *)plate
{
    NSString * plateRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]";
    NSPredicate * plateTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", plateRegex];
    return [plateTest evaluateWithObject:plate];
}

+ (NSDate *)getTodayMidNightTimeInterval
{
    NSDate * nowDate = [NSDate date];
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSString * dayString = [df stringFromDate:nowDate];
    
    NSString * newString = [NSString stringWithFormat:@"%@ 00:00:00", dayString];
    
    NSDateFormatter * df2 = [[NSDateFormatter alloc] init];
    [df2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * newDate = [df2 dateFromString:newString];
    return newDate;
}

+ (void)saveObject:(id)object forKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:object forKey:key];
    [userDefaults synchronize];
}

+ (id)getObjectForKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    id object = [userDefaults objectForKey:key];
    if ([MyUtil isNilOrEmpty:object]) {
        return @"";
    }
    return object;
}

+ (void)saveBool:(BOOL)yesOrNo forKey:(NSString *)key;
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:yesOrNo forKey:key];
    [userDefaults synchronize];
}

+ (BOOL)getBoolForKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL yesOrNo = [userDefaults boolForKey:key];
    return yesOrNo;
}

+ (void)saveInteger:(NSInteger)number forKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:number forKey:key];
    [userDefaults synchronize];
}

+ (NSInteger)getIntegerForKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger number = [userDefaults integerForKey:key];
    return number;
}

+ (id)getViewControllerWithIdentifier:(NSString *)identifier storyboardName:(NSString *)storyboardName
{
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    return viewController;
}

+ (NSString *)getOrderStatusWithValue:(id)value
{
    NSString * string = @"";
    NSInteger status = [value integerValue];
    if (status == 0) {
        string = @"未取号";
    }else if (status == 1){
        string = @"已取号";
    }else{
        string = @"已取消";
    }
    return string;
}

+(NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim
{
    NSScanner *theScanner = [NSScanner scannerWithString:html];
    NSString *text = nil;
    
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:&text] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@""];
        html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    }
    
    return trim ? [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] : html;
}

+ (UIBarButtonItem *)backButtonWithTarget:(id)target action:(SEL)selector
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 0, 30, 30);
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -4, 0, 4)];
    [button setImage:[UIImage imageNamed:@"back_indicatior"] forState:UIControlStateNormal];
//    [button setTitle:@"返回" forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return barButtonItem;
}

+ (id)generateSaveObjectWithDictionary:(NSDictionary *)dict
{
    NSString * nameKey = @"name";
    NSString * idKey = @"id";
    NSDictionary * saveObject = @{nameKey:dict[nameKey], idKey:dict[idKey]};
    return saveObject;
}

+ (BOOL)isValidIdentityCard:(NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (NSString *)dateStringFromObject:(id)object
{
    if (object) {
        double timeStamp = [object doubleValue];
        
        NSDate * date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
        
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM月dd日 HH:mm"];
        NSString * time = [formatter stringFromDate:date];
        return time;
        
    }
    return @"";
}

+ (NSString *)getMarriageStateWithObject:(id)obj
{
    NSInteger state = 0;
    if (![obj isKindOfClass:[NSNull class]]) {
        state = [obj integerValue];
    }
    NSString * marriageState = @"";
    switch (state) {
        case 0:
            marriageState = @"单身";
            break;
        case 1:
            marriageState = @"已婚";
            break;
        case 2:
            marriageState = @"保密";
            break;
        case 3:
            marriageState = @"恋爱中";
            break;
        case 4:
            marriageState = @"其他";
            break;
        default:
            marriageState = @"其他";
            break;
    }
    return marriageState;
}

+ (NSURL *)imageUrlWithString:(NSString *)string
{
    if ([string isKindOfClass:[NSNull class]]) {
        return [NSURL URLWithString:@""];
    }
    NSString * iconUrlString = @"";
    if ([string hasPrefix:@"http"]) {
        iconUrlString = string;
    }else{
        iconUrlString = [NSString stringWithFormat:@"%@%@", URL_GLOBAL, string];
    }
    return [NSURL URLWithString:iconUrlString];
}
//获取测评图片地址
+ (NSURL *)testImageUrlWithString:(NSString *)string
{
    if ([string isKindOfClass:[NSNull class]]) {
        return [NSURL URLWithString:@""];
    }
    NSString * iconUrlString = @"";
//    if ([string hasPrefix:@"http"]) {
//        iconUrlString = string;
//    }else{
//        iconUrlString = [NSString stringWithFormat:@"%@%@", URL_IMAGE_TEST, string];
//    }
    return [NSURL URLWithString:iconUrlString];
}
+ (id)getNoneNillObject:(id)obj
{
    if ([obj isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if ([obj isKindOfClass:[NSString class]] && ([obj isEqualToString:@"<null>"] || [obj isEqualToString:@"(null)"])) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@", obj];
}
+ (void)showTextWithView:(UIView*)view Text:(NSString*)text
{
    if(view == nil) return; // TODO:
    [view endEditing:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = text;
    hud.detailsLabelFont = [UIFont systemFontOfSize:14];
    hud.dimBackground = YES;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.2];
}
//保存到本地
+ (void) saveCenterProValue:(NSString*)valueStr key:(NSString *)keyStr{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:valueStr forKey:keyStr];
    [defaults synchronize];
}
+ (id)getCenterPro:(NSString*)identifier{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:identifier];
}
+(NSString *)getDate:(NSString *)str
{
    //  NSDate *date = [NSDate date];
    NSString * str1 = [str substringToIndex:10];
    NSDate *now = [NSDate date];
    //
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString * str2 = [[dateFormatter stringFromDate:now] substringToIndex:10];
    if ([str1 isEqualToString:str2]) {
        str1 = [str substringWithRange:NSMakeRange(10, 6)];
    }
    
    
    return str1;
    
}
+(NSString *)getBirthday:(NSString *)str
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //医生出生日期
    if ([MyUtil isNilOrEmpty:str]) {
        return @"";
    }
    NSString * str1 = [str substringToIndex:10];
    //现在的时间
    NSString * str2 = [[dateFormatter stringFromDate:[NSDate date]] substringToIndex:10];
    
    NSDate *date2 =[dateFormatter dateFromString:str2];
    NSDate *date1 =[dateFormatter dateFromString:str1];
    NSTimeInterval time=[date2 timeIntervalSinceDate:date1];
    int days=((int)time)/(3600*24);
    
    NSString *dateContent=[[NSString alloc] initWithFormat:@"%d",days/365];
    return dateContent;
    
}

+ (NSInteger)getAgeWithTimeStamp:(NSTimeInterval)timeInterval
{
    NSTimeInterval nowTimeInterval = [[NSDate date] timeIntervalSince1970];
    NSInteger days = (nowTimeInterval - timeInterval) / (3600 * 24);
    return days / 365;
}

+ (NSString *)getPhoneReserveStateStringWithState:(id)state
{
    NSString * string = @"";
    if ([state isKindOfClass:[NSNull class]]) {
        string = @"";
    }else{
        NSString * stateString = state[@"state"];
        NSInteger stateNumber = [stateString integerValue];
        if (stateNumber == -1) {
            string = @"患者不认可";
        }else if (stateNumber == 0){
            string = @"我已确认";
        }else if (stateNumber == 1){
            BOOL isExpire = NO;
            NSString * timeString = [NSString stringWithFormat:@"%@ %@", state[@"day"], state[@"times"]];
            NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyyMMdd HH:mm"];
            NSDate * orderDate = [dateFormatter dateFromString:timeString];
            NSTimeInterval seconds = [orderDate timeIntervalSinceNow];
            if (seconds < -60 * 60 * 3) {
                isExpire = YES;
            }
            if (isExpire) {
                string = @"预约已过期";
            }else{
                string = @"预约创建";
            }
        }else if (stateNumber == 2){
            string = @"医生已确认";
        }
    }
    return string;
}

+ (NSString *)getOnDoorReserveStateStringWithState:(id)state
{
    NSString * string = @"";
    if ([state isKindOfClass:[NSNull class]]) {
        string = @"";
    }else{
        NSInteger stateNumber = [state integerValue];
        switch (stateNumber) {
            case 0:
            {
                string = @"已发起";
            }
                break;
            case 1:
            {
                string = @"已同意";
            }
                break;
            case 2:
            {
                string = @"不同意";
            }
                break;
            case 3:
            {
                string = @"已关闭";
            }
                break;
            case 4:
            {
                string = @"已确认";
            }
                break;
            case 5:
            {
                string = @"未确认";
            }
                break;
                
            default:
                break;
        }
    }
    return string;
}

+ (NSString *)getWeekdayWithDate:(NSDate *)date
{
    NSString * weekday = @"";
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit |NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    DLog(@"Weekday: %@", @(comps.weekday));
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

+ (NSString *)getNoneNilString:(id)obj
{
    NSString * string = @"";
    if (![obj isKindOfClass:[NSNull class]]) {
        string = [NSString stringWithFormat:@"%@", obj];
    }
    if (obj == nil) {
        string = @"";
    }
    if ([obj isKindOfClass:[NSString class]] && [obj isEqualToString:@"null"]) {
        string = @"";
    }
    return string;
}

+ (NSString *)getLevelWithId:(id)levelId
{
    if ([levelId isKindOfClass:[NSNull class]]) {
        return @"";
    }
    NSInteger levelNumber = [levelId integerValue];
    NSString * string = @"";
    switch (levelNumber) {
        case 1:
        {
            string = @"差";
        }
            break;
        case 2:
        {
            string = @"一般";
        }
            break;
        case 3:
        {
            string = @"较满意";
        }
            break;
        case 4:
        {
            string = @"满意";
        }
            break;
        case 5:
        {
            string = @"非常满意";
        }
            break;
            
        default:
            break;
    }
    return string;
}

+ (void)jumpToLoginIfNeededWithViewController:(UIViewController *)viewController responseObject:(id)obj
{
    NSString * tipString = obj[@"data"][@"msg"];
    if ([@"请登录" isEqualToString:tipString]) {
        UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        UINavigationController * navigationController = [sb instantiateViewControllerWithIdentifier:@"loginNavigation"];
        [viewController presentViewController:navigationController animated:YES completion:^{
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"SS_LOGIN_KEY"];
            [[NSUserDefaults standardUserDefaults] synchronize];
//            [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:YES];
        }];
    }
}

+ (NSInteger)getAgeWithDateString:(NSString *)dateString andDateFormate:(NSString *)format
{
    if ([dateString isKindOfClass:[NSNull class]]) {
        return 0;
    }
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate * pastDate = [dateFormatter dateFromString:dateString];
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:pastDate];
    NSInteger age = timeInterval / (60 * 60 * 24 * 365);
    return age;
}

+ (void)jumpToLoginWithViewController:(UIViewController *)viewController
{
    UINavigationController * loginNavigationController = [MyUtil getViewControllerWithIdentifier:@"loginNavigation" storyboardName:@"Login"];
    [viewController presentViewController:loginNavigationController animated:YES completion:^{
        
    }];
}

+ (NSString *)getCertificateName:(NSDictionary *)dict
{
    NSString * work = [MyUtil getNoneNilString:dict[@"work"]];
    NSString * profession_auth = [MyUtil getNoneNilString:dict[@"profession_auth"]];
    NSString * firstString = [NSString stringWithFormat:@"%@%@", work, profession_auth];
    
    NSString * school = [MyUtil getNoneNilString:dict[@"school"]];
    NSString * major = [MyUtil getNoneNilString:dict[@"major"]];
    NSString * degree = [MyUtil getNoneNilString:dict[@"degree"]];
    NSString * secondString = [NSString stringWithFormat:@"%@%@%@", school, major, degree];
    
    if ([MyUtil isNilOrEmpty:firstString] && [MyUtil isNilOrEmpty:secondString]) {
        return @"暂无";
    }
    
    if ([MyUtil isNilOrEmpty:firstString]) {
        return secondString;
    }
    if ([MyUtil isNilOrEmpty:secondString]) {
        return firstString;
    }
    return [NSString stringWithFormat:@"%@,%@", firstString, secondString];
}
+(NSString *)deleteSpaceStr:(NSString *)str
{
    NSString * saveStr = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return saveStr;
}

+ (UIImage*)getGrayImage:(UIImage*)sourceImage
{
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,width,height,8,0,colorSpace,kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL) {
        return nil;
    }
    
    CGContextDrawImage(context,CGRectMake(0, 0, width, height), sourceImage.CGImage);
    CGImageRef grayImageRef = CGBitmapContextCreateImage(context);
    UIImage *grayImage = [UIImage imageWithCGImage:grayImageRef];
    CGContextRelease(context);
    CGImageRelease(grayImageRef);
    
    return grayImage;
}

+ (NSString *)dateStringForDiscoveryWithString:(NSString *)string
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date = [dateFormatter dateFromString:string];
    NSTimeInterval displayTimeInterval = [date timeIntervalSince1970];
    NSDate * nowDate = [NSDate date];
    NSString * nowDateString = [dateFormatter stringFromDate:nowDate];
    nowDateString = [nowDateString stringByReplacingCharactersInRange:NSMakeRange(11, 8) withString:@"00:00:00"];
    NSDate * todayMidNightDate = [dateFormatter dateFromString:nowDateString];
    NSTimeInterval todayTimeInterval = [todayMidNightDate timeIntervalSince1970];
    NSDate * yesterdayMidNightDate = [todayMidNightDate dateByAddingTimeInterval:-24 * 60 * 60];
    NSTimeInterval yesterdayTimeInterval = [yesterdayMidNightDate timeIntervalSince1970];
    NSDate * theDayBeforeYesterdayDate = [todayMidNightDate dateByAddingTimeInterval:- 2 * 24 * 60 * 60];
    NSTimeInterval theDayBeforeYesterdayTimeInterval = [theDayBeforeYesterdayDate timeIntervalSince1970];
    [dateFormatter setDateFormat:@"HH:mm"];
    if (displayTimeInterval > todayTimeInterval) {
        return [dateFormatter stringFromDate:date];
    }else if (displayTimeInterval > yesterdayTimeInterval){
        NSString * display = [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:date]];
        return display;
    }else if (displayTimeInterval > theDayBeforeYesterdayTimeInterval){
        NSString * display = [NSString stringWithFormat:@"前天 %@", [dateFormatter stringFromDate:date]];
        return display;
    }
    [dateFormatter setDateFormat:@"MM月dd日 HH:mm"];
    return [dateFormatter stringFromDate:date];
}

+ (CLLocationDistance)distanceForLocation:(CLLocation *)location1 toLocation:(CLLocation *)location2
{
    CLLocationDistance distance = [location1 distanceFromLocation:location2];
    return distance;
}

+ (NSString *)distanceWithLnt:(id)lat andLng:(id)lng withCity:(NSString *)city
{
    return @"";
//    NSArray * array = @[];
//    if (![MyUtil isNilOrEmpty:city]) {
//        NSString * nowCity = [city stringByReplacingOccurrencesOfString:@"-" withString:@";"];
//        array = [nowCity componentsSeparatedByString:@";"];
//    }
//    NSString * stringCity = @"";
//    if (array.count > 1) {
//        stringCity = array[1];
//    }
//    if (![CLLocationManager locationServicesEnabled]) {
//        return stringCity;
//    }
//    double longitude = 0;
//    double latitude = 0;
//    if (![MyUtil isNilOrEmpty:lat]) {
//        latitude = [lat doubleValue];
//    }
//    if (![MyUtil isNilOrEmpty:lng]) {
//        longitude = [lng doubleValue];
//    }
//    if (longitude == 0 && latitude == 0) {
//        return stringCity;
//    }
//    double myLongitude = [[MyUtil getObjectForKey:SH_long] doubleValue];
//    double myLatitude = [[MyUtil getObjectForKey:SH_lat] doubleValue];
//    
//    CLLocation * location1 = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
//    CLLocation * location2 = [[CLLocation alloc] initWithLatitude:myLatitude longitude:myLongitude];
//    NSInteger distance = [MyUtil distanceForLocation:location1 toLocation:location2];
//    
//    if (distance < 50) {
//        return [NSString stringWithFormat:@"<50m"];
//    }
//    
//    if (distance > 1000) {
//        distance /= 1000;
//        if (distance > 500) {
//            return [NSString stringWithFormat:@">500km"];
//        }
//        return [NSString stringWithFormat:@"%@km", @(distance)];
//    }
//    return [NSString stringWithFormat:@"%@m", @(distance)];
}

+ (void)jumpToMyCenterWithViewController:(UIViewController *)viewController
{
    UIViewController * myCenterViewController = [[UIStoryboard storyboardWithName:@"MyCenter" bundle:nil] instantiateViewControllerWithIdentifier:@"myCenterHome"];
    [viewController.navigationController pushViewController:myCenterViewController animated:YES];
}

+ (void)showAlertText:(NSString *)text
{
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"提示";
    hud.labelFont = [UIFont systemFontOfSize:15];
    hud.detailsLabelText = text;
    hud.detailsLabelFont = [UIFont systemFontOfSize:13];
    hud.dimBackground = YES;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:SHOW_TIP_TIME];
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)selector
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    CGFloat width = title.length * 15;
    button.frame = CGRectMake(0, 0, width, 30);
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (void)showAlertWithText:(NSString *)text isForSuccess:(BOOL)isForSuccess completion:(MBProgressHUDCompletionBlock)block
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window] animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.color = [UIColor clearColor];
    hud.dimBackground = YES;
    hud.removeFromSuperViewOnHide = YES;
    HudView * view = [[HudView alloc] init];
    view.title = text;
    view.type = isForSuccess ? 0 : 1;
    hud.customView = view;
    if (block) {
        hud.completionBlock = block;
    }
    [hud hide:YES afterDelay:1.2];
}

+ (void)showErrorText:(NSString *)text
{
    [MyUtil showAlertWithText:text isForSuccess:NO completion:nil];
}

+ (void)showErrorText:(NSString *)text completion:(MBProgressHUDCompletionBlock)block
{
    [MyUtil showAlertWithText:text isForSuccess:NO completion:block];
}

+ (void)showSuccessText:(NSString *)text
{
    [MyUtil showAlertWithText:text isForSuccess:YES completion:nil];
}

+ (void)showSuccessText:(NSString *)text completion:(MBProgressHUDCompletionBlock)block
{
    [MyUtil showAlertWithText:text isForSuccess:YES completion:block];
}

+ (void)showTipText:(NSString *)text
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window] animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.color = MyColor(250, 250, 250);
    hud.dimBackground = YES;
    hud.removeFromSuperViewOnHide = YES;
    hud.detailsLabelText = text;
    [hud hide:YES afterDelay:1.2];
}

+ (void)showTipText:(NSString *)text completion:(MBProgressHUDCompletionBlock)block
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window] animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.color = MyColor(250, 250, 250);
    hud.dimBackground = YES;
    hud.removeFromSuperViewOnHide = YES;
    hud.detailsLabelText = text;
    if (block) {
        hud.completionBlock = block;
    }
    [hud hide:YES afterDelay:1.2];
}

+ (NSString *)getMd5Password:(NSString *)string
{
    NSString * firstMd5 = [[NSString stringWithFormat:@"%@hrjkgs.com", string] md5];
    return [[NSString stringWithFormat:@"%@hrjkgs.com", firstMd5] md5];
}

+ (NSString *)getJobTitleWithId:(id)jobtitleId
{
    NSInteger number = [jobtitleId integerValue];
    NSString * jobTitle = @"";
    switch (number) {
        case 1001:
        {
            jobTitle = @"主任医师";
        }
            break;
        case 1002:
        {
            jobTitle = @"副主任医师";
        }
            break;
        case 1003:
        {
            jobTitle = @"主治医师";
        }
            break;
        case 1004:
        {
            jobTitle = @"住院医师";
        }
            break;
            
        default:
            break;
    }
    return jobTitle;
}

+ (NSArray *)getOfficeTypeWithKey:(NSString *)key key1:(NSString *)key1
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"const" ofType:@"plist"];
    if (!filePath) {
        return @[];
    }
    NSDictionary *content = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSDictionary *path = [content objectForKey:key];
    NSArray *contents = [path objectForKey:@"contents"];
    if (key1) {
        for (NSDictionary *item in contents) {
            if ([key1 isEqualToString:item[@"code"]]) {
                return [item objectForKey:@"name"];
            }
        }
        return @[];
    }
    return contents;
}

+ (BOOL)isValidIdCardNumber:(id)idNumber
{
    NSString * regex = @"^(\\d{6})(\\d{4})(\\d{2})(\\d{2})(\\d{3})([0-9]|X|x)$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:idNumber];
    return isMatch;
}

+ (NSArray *)getConstArrayWithKey:(NSString *)key
{
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"const" ofType:@"plist"];
    if (!filePath) {
        return @[];
    }
    NSDictionary * content = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSDictionary * path = content[key];
    NSArray * array = path[@"contents"];
    return array;
}

+ (void)showProgressHud
{
    UIView * customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 67, 67)];
    customView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    UIImageView * outerImageView = [[UIImageView alloc] initWithFrame:customView.bounds];
    outerImageView.image = [UIImage imageNamed:@"icon_hud_outer"];
    outerImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = 0;
    animation.toValue = [NSNumber numberWithFloat:M_PI*2];
    animation.duration = 1.2;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.removedOnCompletion = NO;
    animation.repeatCount = INFINITY;
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = NO;
    [outerImageView.layer addAnimation:animation forKey:@"rotation"];
    [customView addSubview:outerImageView];
    
    UIImageView *innerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 38, 31)];
    innerView.image = [UIImage imageNamed:@"icon_hud_inner"];
    innerView.center = outerImageView.center;
    innerView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [customView addSubview:innerView];
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = customView;
    hud.dimBackground = YES;
    hud.removeFromSuperViewOnHide = YES;
    hud.color = [UIColor whiteColor];
}

+ (void)hideProgressHud
{
    [MBProgressHUD hideAllHUDsForView:[[UIApplication sharedApplication] keyWindow] animated:YES];
}

+ (void)goLogin
{
    if (GY_APP_DELEGATE.tabBarController) {
        UINavigationController * loginNavigationController = getViewController(@"loginNavigation", @"Login");
        [GY_APP_DELEGATE.tabBarController presentViewController:loginNavigationController animated:YES completion:^{
            GY_APP_DELEGATE.tabBarController = nil;
        }];
    }
}

+ (NSString *)getDeseaseTypeWithId:(id)typeId
{
    NSString * type = @"";
    NSArray * array = [MyUtil getConstArrayWithKey:@"LiverType"];
    for (NSDictionary * dict in array) {
        NSInteger number = [dict[@"code"] integerValue];
        NSInteger nowNumber = [typeId integerValue];
        if (number == nowNumber) {
            type = dict[@"name"];
            break ;
        }
    }
    return type;
}


+ (UIImage *)fixOrientationWithImage:(UIImage *)aImage
{
    if (aImage.imageOrientation == UIImageOrientationUp)
        
        return aImage;
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
            
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
            
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

+ (NSString *)getShouZhenDisplayStringWithText:(NSString *)text
{
    if ([MyUtil isNilOrEmpty:text]) {
        return @"未填写";
    }
    return @"已填写";
}

+ (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

+ (NSDictionary *)getXywyApiConfigWithKey:(NSString *)key
{
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"xywy_api" ofType:@"plist"];
    NSDictionary * allContent = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return allContent[key];
}

@end
