//
//  constant.h
//  Utils
//
//  Created by Pang Weibo on 16-08-21.
//  Copyright (c) 2016年 Pang Weibo All rights reserved.
//

#ifndef Util_constant_h
#define Util_constant_h

#import "MyUtil.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "LBXAlertAction.h"
#import "MBProgressHUD.h"
#import "MJExtension.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "TPKeyboardAvoidingTableView.h"
#import "TPKeyboardAvoidingCollectionView.h"
#import "NSString+MD5.h"
#import "Masonry.h"
#import "LJXPhotoAlbum.h"
#import "MJRefresh.h"
#import "WBGlobalConfig.h"
#import "WBDateUtil.h"

#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

#ifndef DEBUG
#define DEBUG
#endif

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define MyAlert(x)                  [MyUtil showAlert:x]
#define MyFullAlert(t, m)           [MyUtil showAlertWithTitle:t withMessage:m]
#define getVC(vcID, sbName)         [[UIStoryboard storyboardWithName:sbName bundle:nil] instantiateViewControllerWithIdentifier:vcID]
#define getNoneNil(object)          [MyUtil getNoneNilString:object]
#define MyColor(x, y, z)            [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1]
#define MyFont(x)                   [UIFont systemFontOfSize:x]
#define MyBoldFont(x)               [UIFont boldSystemFontOfSize:x]
#define MyImage(x)                  [UIImage imageNamed:x]
#define MyNib(x)                    [UINib nibWithNibName:x bundle:nil]
#define HIDE_PROGRESS               [MyUtil hideProgressHud]
#define SHOW_PROGRESS               [MyUtil showProgressHud]
#define isEmpty(x)                  [MyUtil isNilOrEmpty:x]
#define showTip(x)                  [MyUtil showTipText:x]
#define appKeyWindow                [[UIApplication sharedApplication] keyWindow]
#define MyLabelSize(text, maxSize, foneSize) [MyUtil labelSizeWithText:text maxSize:maxSize fontSize:foneSize]
#define MyColorFromHex(s)               [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]

//系统版本和屏幕size
#define OS_VERSION      [[[UIDevice currentDevice] systemVersion] integerValue]
#define SCREEN_FRAME    [[UIScreen mainScreen] bounds]

//网络错误的宏定义
#define NETWORK_ERROR_TITLE         @"网络连接失败"
#define NETWORK_ERROR_MESSAGE       @"网络连接错误，请稍后再试"

//复用cell的identifier
#define IDENTIFIER     @"Cell"
#define IDENTIFIER_COLLECTIONCELL       @"IDENTIFIER_COLLECTIONCELL"
#define IDENTIFIER_REUSEVIEW            @"IDENTIFIER_REUSEVIEW"

//默认头像和默认图片
#define DEFAULT_PLACEHODER          [UIImage imageNamed:@"default_placeholder"]
#define DEFAULT_AVATAR              [UIImage imageNamed:@"default_avatar"]

//网络请求分页使用
#define MY_PAGE_SIZE                @"20"
#define MY_PAGE_INTEGER             20

typedef void(^CompletionBlockString)(NSString * string);

typedef void(^CompletionBlockArray)(NSArray * array);

typedef void(^CompletionBlockDictionary)(NSDictionary * dict);

typedef void(^CompletionBlockIndex)(NSInteger index);

typedef void(^CompletionBlockDate)(NSDate * date);

typedef void(^CompletionBlockBool)(BOOL ok);

typedef void(^CompletionBlockEmpty)(void);

typedef void(^CompletionBlockAny)(id obj);

#endif
