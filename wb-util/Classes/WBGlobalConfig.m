//
//  WBGlobalConfig.m
//  AFNetworking
//
//  Created by Pang Weibo on 2019/1/21.
//

#import "WBGlobalConfig.h"
#import <UIKit/UIKit.h>

@implementation WBGlobalConfig

+ (instancetype)sharedConfig
{
    static WBGlobalConfig *sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^(void) {
        sharedSingleton = [[self alloc] init];
    });
    return sharedSingleton;
}

@end
