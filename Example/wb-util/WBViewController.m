//
//  WBViewController.m
//  wb-util
//
//  Created by Pang Weibo on 12/19/2018.
//  Copyright (c) 2018 Pang Weibo. All rights reserved.
//

#import "WBViewController.h"
#import "constant.h"

@interface WBViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tf;

@end

@implementation WBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)action:(id)sender {
//    [MyUtil showTipText:@"字体大小的改变字体大小的改变字体大小的改变字体大小的改变字体大小的改变字体大小的改变字体大小的改变"];
    NSString * text = _tf.text;
    if ([MyUtil isValidMobile:text]) {
        showTip(@"有效");
    } else {
        showTip(@"无效");
    }
}
@end
