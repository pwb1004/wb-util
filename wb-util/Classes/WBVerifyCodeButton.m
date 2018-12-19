//
//  WBVerifyCodeButton.m
//  GanYouHui
//
//  Created by Apple on 2017/5/5.
//  Copyright © 2017年 hrjkgs.com. All rights reserved.
//

#import "WBVerifyCodeButton.h"

@interface WBVerifyCodeButton ()

@property (nonatomic, strong) NSTimer * timer;

@property (nonatomic, assign) NSInteger count;

@end

@implementation WBVerifyCodeButton

- (void)defaultInit
{
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self defaultInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self defaultInit];
    }
    return self;
}

- (void)getCodeSuccess
{
    self.count = 60;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)timerAction
{
    self.count--;
    if (self.count > 0) {
        self.enabled = NO;
        NSString * title = [NSString stringWithFormat:@"重新获取(%@)", @(self.count)];
        [self setTitle:title forState:UIControlStateDisabled];
    }else{
        self.enabled = YES;
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)dealloc
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
