//
//  MyPopView.h
//  Utils
//
//  Created by Pang Weibo on 16-08-21.
//  Copyright (c) 2016年 Pang Weibo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "constant.h"

@interface MyPopView : UIView

- (instancetype)initWithArray:(NSArray *)array andDisplayKey:(NSString *)key andTitle:(NSString *)title;

- (void)show;
- (void)hide;

- (void)showWithCompletion:(CompletionBlockIndex)block;

@end
