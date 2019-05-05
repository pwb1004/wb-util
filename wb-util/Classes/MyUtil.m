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
#import "WBGlobalConfig.h"

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

+ (BOOL)isValidMobile:(NSString *)mobileNum
{
    NSString * MOBILE = @"^1[345789]\\d{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:mobileNum] == YES){
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

+ (NSURL *)imageURLWithString:(NSString *)string
{
    if ([string isKindOfClass:[NSNull class]]) {
        return [NSURL URLWithString:@""];
    }
    NSString * iconUrlString = @"";
    if ([string hasPrefix:@"http"]) {
        iconUrlString = string;
    }else{
        iconUrlString = [NSString stringWithFormat:@"%@%@", [WBGlobalConfig sharedConfig].globalImageURLString, string];
    }
    return [NSURL URLWithString:iconUrlString];
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
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
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

+ (NSString *)getDeviceUUID
{
    NSString * uuid = [[UIDevice currentDevice] identifierForVendor].UUIDString;
    uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return uuid;
}

+ (NSString *)getTrimString:(NSString *)s
{
    NSString * rs = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return rs;
}

+ (void)showAlert:(NSString *)msg
{
    [LBXAlertAction showAlertWithTitle:@"" msg:msg buttonsStatement:@[@"确定"] chooseBlock:^(NSInteger buttonIdx) {
        
    }];
}

+ (void)showAlertWithTitle:(NSString *)title withMessage:(NSString *)msg
{
    [LBXAlertAction showAlertWithTitle:title msg:msg buttonsStatement:@[@"确定"] chooseBlock:^(NSInteger buttonIdx) {
        
    }];
}

@end
