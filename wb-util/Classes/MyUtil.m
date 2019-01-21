//
//  MyUtil.m
//  Utils
//
//  Created by Pang Weibo on 16-08-21.
//  Copyright (c) 2016年 Pang Weibo All rights reserved.
//

#import "MyUtil.h"
#import "constant.h"
#import "NSString+MD5.h"

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
    NSString * MOBILE = @"^1[34578]\\d{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:mobileNum] == YES){
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)isValidPhone:(NSString *)phone
{
    NSString * MOBILE = @"\\d{3}-\\d{8}|\\d{4}-\\d{7,8}";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:phone] == YES){
        return YES;
    }else{
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
    NSString * plateRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4,5}[a-zA-Z_0-9_\u4e00-\u9fa5]";
    NSPredicate * plateTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", plateRegex];
    return [plateTest evaluateWithObject:plate];
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

+ (void)saveDouble:(double)number forKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setDouble:number forKey:key];
    [userDefaults synchronize];
}

+ (double)getDoubleForKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    double number = [userDefaults doubleForKey:key];
    return number;
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


+ (BOOL)isChinese:(NSString *)str
{
    for(int i=0; i< [str length];i++)
    {
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)//判断输入的是否是中文
        {
            return YES;
        }
    }
    return NO;
}

+ (BOOL)checkProductDate:(NSString *)tempDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:tempDate];
    // 判断是否大于当前时间
    if ([date earlierDate:[NSDate date]] != date) {
        return true;
    } else {
        return false;
    }
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

+ (NSURL *)imageUrlWithString:(NSString *)string
{
    if ([string isKindOfClass:[NSNull class]]) {
        return [NSURL URLWithString:@""];
    }
    NSString * iconUrlString = @"";
    if ([string hasPrefix:@"http"]) {
        iconUrlString = string;
    }else{
        iconUrlString = [NSString stringWithFormat:@"%@%@", @"http://www.hrjkgs.com", string];
    }
    return [NSURL URLWithString:iconUrlString];
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


+ (CLLocationDistance)distanceForLocation:(CLLocation *)location1 toLocation:(CLLocation *)location2
{
    CLLocationDistance distance = [location1 distanceFromLocation:location2];
    return distance;
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

+ (void)showTipText:(NSString *)text
{
    [MyUtil showTipText:text completion:nil];
}

+ (void)showTipText:(NSString *)text completion:(MBProgressHUDCompletionBlock)block
{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    [MBProgressHUD hideHUDForView:window animated:YES];
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    hud.removeFromSuperViewOnHide = YES;
    hud.detailsLabel.text = text;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.detailsLabel.textColor = [UIColor whiteColor];
    if (block) {
        hud.completionBlock = block;
    }
    [hud hideAnimated:YES afterDelay:SHOW_TIP_TIME];
}

+ (BOOL)isValidIdCardNumber:(id)idNumber
{
    NSString * regex = @"^(\\d{6})(\\d{4})(\\d{2})(\\d{2})(\\d{3})([0-9]|X|x)$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:idNumber];
    return isMatch;
}

+ (void)showProgressHud
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideHUDForView:window animated:YES];
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    hud.removeFromSuperViewOnHide = YES;
}

+ (void)hideProgressHud
{
    [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication] keyWindow] animated:YES];
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


+ (UIViewController *)findNearsetViewController:(UIView *)view {
    UIViewController *viewController = nil;
    for (UIView *next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            viewController = (UIViewController *)nextResponder;
            break;
        }
    }
    return viewController;
}
+(NSString *)deleteSpaceStr:(NSString *)str
{
    NSString * saveStr = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return saveStr;
}

//删除字典里的null值
+ (NSDictionary *)deleteEmpty:(NSDictionary *)dic
{
    NSMutableDictionary *mdic = [[NSMutableDictionary alloc] initWithDictionary:dic];
    NSMutableArray *set = [[NSMutableArray alloc] init];
    NSMutableDictionary *dicSet = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *arrSet = [[NSMutableDictionary alloc] init];
    for (id obj in mdic.allKeys)
    {
        id value = mdic[obj];
        if ([value isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *changeDic = [MyUtil deleteEmpty:value];
            [dicSet setObject:changeDic forKey:obj];
        }
        else if ([value isKindOfClass:[NSArray class]])
        {
            NSArray *changeArr = [MyUtil deleteEmptyArr:value];
            [arrSet setObject:changeArr forKey:obj];
        }
        else
        {
            if ([value isKindOfClass:[NSNull class]]) {
                [set addObject:obj];
            }
        }
    }
    for (id obj in set)
    {
        mdic[obj] = @"";
    }
    for (id obj in dicSet.allKeys)
    {
        mdic[obj] = dicSet[obj];
    }
    for (id obj in arrSet.allKeys)
    {
        mdic[obj] = arrSet[obj];
    }
    
    return mdic;
}

//删除数组中的null值
+ (NSArray *)deleteEmptyArr:(NSArray *)arr
{
    NSMutableArray *marr = [NSMutableArray arrayWithArray:arr];
    NSMutableArray *set = [[NSMutableArray alloc] init];
    NSMutableDictionary *dicSet = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *arrSet = [[NSMutableDictionary alloc] init];
    
    for (id obj in marr)
    {
        if ([obj isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *changeDic = [self deleteEmpty:obj];
            NSInteger index = [marr indexOfObject:obj];
            [dicSet setObject:changeDic forKey:@(index)];
        }
        else if ([obj isKindOfClass:[NSArray class]])
        {
            NSArray *changeArr = [self deleteEmptyArr:obj];
            NSInteger index = [marr indexOfObject:obj];
            [arrSet setObject:changeArr forKey:@(index)];
        }
        else
        {
            if ([obj isKindOfClass:[NSNull class]]) {
                NSInteger index = [marr indexOfObject:obj];
                [set addObject:@(index)];
            }
        }
    }
    for (id obj in set)
    {
        marr[(int)obj] = @"";
    }
    for (id obj in dicSet.allKeys)
    {
        int index = [obj intValue];
        marr[index] = dicSet[obj];
    }
    for (id obj in arrSet.allKeys)
    {
        int index = [obj intValue];
        marr[index] = arrSet[obj];
    }
    return marr;
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
+ (void)jumpToLoginWithViewController:(UIViewController *)viewController
{
    UINavigationController * loginNavigationController = [MyUtil getViewControllerWithIdentifier:@"loginNavigation" storyboardName:@"Login"];
    [viewController presentViewController:loginNavigationController animated:YES completion:^{
        
    }];
}

+ (void)showAlertWithText:(NSString *)text isForSuccess:(BOOL)isForSuccess completion:(MBProgressHUDCompletionBlock)block
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window] animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.color = [UIColor clearColor];
    hud.dimBackground = YES;
    hud.removeFromSuperViewOnHide = YES;
//    HudView * view = [[HudView alloc] init];
//    view.title = text;
//    view.type = isForSuccess ? 0 : 1;
//    hud.customView = view;
    if (block) {
        hud.completionBlock = block;
    }
    [hud hideAnimated:YES afterDelay:1.2];
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

+ (NSString *)getMd5Password:(NSString *)string
{
    NSString * firstMd5 = [[NSString stringWithFormat:@"%@hrjkgs.com", string] md5];
    return [[NSString stringWithFormat:@"%@hrjkgs.com", firstMd5] md5];
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
+ (void)goLogin
{
    UINavigationController * loginNavigationController = getVC(@"loginNavigation", @"Login");
    [[[[UIApplication sharedApplication]keyWindow]rootViewController] presentViewController:loginNavigationController animated:YES completion:^{
//        GY_APP_DELEGATE.tabBarController = nil;
    }];
}
+ (NSString *)getIPAddress {
    NSString *address = @"0.0.0.0";
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
    
    /*
     * 此处可以选择是优先返回wifi的还是cell的，或者ipv4的还是ipv6的
     */
    //    BOOL preferIPv4 = NO;
    //    NSArray *searchArray = preferIPv4 ?
    //    @[IOS_WIFI @"/"IP_ADDR_IPv4, IOS_WIFI@"/" IP_ADDR_IPv6,IOS_CELLULAR @"/"IP_ADDR_IPv4, IOS_CELLULAR@"/" IP_ADDR_IPv6] :
    //    @[IOS_WIFI @"/"IP_ADDR_IPv6, IOS_WIFI@"/" IP_ADDR_IPv4,IOS_CELLULAR @"/"IP_ADDR_IPv6, IOS_CELLULAR@"/" IP_ADDR_IPv4] ;
    //
    //    NSDictionary *addresses = [MyUtil getIPAddresses];
    //    NSLog(@"addresses: %@", addresses);
    //
    //    __blockNSString *address;
    //    [searchArray enumerateObjectsUsingBlock:^(NSString *key,NSUInteger idx, BOOL *stop)
    //     {
    //         address = addresses[key];
    //         if(address) *stop =YES;
    //     } ];
    //    return address ? address :@"0.0.0.0";
}

+ (NSDictionary *)getXywyApiConfigWithKey:(NSString *)key
{
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"xywy_api" ofType:@"plist"];
    NSDictionary * allContent = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return allContent[key];
}
+ (BOOL)isValidPassword:(NSString *)password
{
    NSString * MOBILE = @"^[0-9a-zA-Z]{6,15}";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:password] == YES){
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)isValidNickname:(NSString *)nickname
{
    NSString * MOBILE = @"^[0-9a-zA-Z\u4e00-\u9fa5]{2,8}";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:nickname] == YES){
        return YES;
    }else{
        return NO;
    }
}

+ (NSString *)getSwitchStatus:(NSInteger)integer
{
    if (integer ==0) {
        return @"每天";
    }
    else if (integer ==1) {
        return @"星期一";
    }
    else if (integer ==2) {
        return @"星期二";
    }
    else if (integer ==3) {
        return @"星期三";
    }
    else if (integer ==4) {
        return @"星期四";
    }
    else if (integer ==5) {
        return @"星期五";
    }
    else if (integer ==6) {
        return @"星期六";
    }
    else if (integer ==7) {
        return @"星期日";
    }
    return @"每天";
}

+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]){
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    result = [MyUtil getTopVC:result];
    if ([result isKindOfClass:[UITabBarController class]]) {
        UITabBarController * tabBarController = (UITabBarController *)result;
        result = tabBarController.selectedViewController;
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        UINavigationController * nVC = (UINavigationController *)result;
        result = nVC.topViewController;
    }
    return result;
}

+ (UIViewController *)getTopVC:(UIViewController *)vc
{
    if (vc.presentedViewController) {
        return [MyUtil getTopVC:vc.presentedViewController];
    }
    return vc;
}

/** 计算label的size*/
+ (CGSize)labelSizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}

+ (void)showActionSheetWithTitles:(NSArray *)titles completion:(void (^)(NSInteger index))block
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSInteger i = 0; i < titles.count; i++) {
        UIAlertAction * action = [UIAlertAction actionWithTitle:getNoneNil(titles[i]) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            block(i);
        }];
        [alert addAction:action];
    }
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        block(-1);
    }];
    
    [alert addAction:cancelAction];
    [[MyUtil getCurrentVC] presentViewController:alert animated:YES completion:nil];
}

/**
 判断是否是表情
 yes 是表情
 */
+ (BOOL)isContainsTwoEmoji:(NSString *)string{
    __block BOOL isEomji =NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring,NSRange substringRange,NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         //         NSLog(@"hs++++++++%04x",hs);
         if (0xd800 <= hs && hs <=0xdbff) {
             if (substring.length >1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs -0xd800) *0x400) + (ls -0xdc00) +0x10000;
                 if (0x1d000 <= uc && uc <=0x1f77f)
                 {
                     isEomji =YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls ==0x20e3|| ls ==0xfe0f) {
                 isEomji =YES;
             }
         } else {
             if (0x2100 <= hs && hs <=0x27ff && hs != 0x263b) {
                 isEomji =YES;
             } else if (0x2B05 <= hs && hs <=0x2b07) {
                 isEomji =YES;
             } else if (0x2934 <= hs && hs <=0x2935) {
                 isEomji =YES;
             } else if (0x3297 <= hs && hs <=0x3299) {
                 isEomji =YES;
             } else if (hs ==0xa9 || hs ==0xae || hs ==0x303d || hs ==0x3030 || hs ==0x2b55 || hs ==0x2b1c || hs ==0x2b1b || hs ==0x2b50|| hs ==0x231a ) {
                 isEomji =YES;
             }
         }
         
     }];
    if ([MyUtil isNineKeyBoard:string]) {
        isEomji = NO;
    }
    
    return isEomji;
}

/**
 判断是不是九宫格
 @param string  输入的字符
 @return YES(是九宫格拼音键盘)
 */
+ (BOOL)isNineKeyBoard:(NSString *)string
{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    int len = (int)string.length;
    for(int i=0;i<len;i++)
    {
        if(!([other rangeOfString:string].location != NSNotFound))
            return NO;
    }
    return YES;
}

@end
