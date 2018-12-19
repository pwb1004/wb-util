//
//  MyPopView.m
//  Utils
//
//  Created by Pang Weibo on 16-08-21.
//  Copyright (c) 2016年 Pang Weibo All rights reserved.
//

#import "MyPopView.h"

@interface MyPopView ()<UITableViewDataSource, UITableViewDelegate>
{
    UIControl * _overlayView;
    
    CompletionBlockIndex _ok;
    
}

@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, strong) NSArray * items;
@property (nonatomic, copy) NSString * key;

@end

@implementation MyPopView

- (instancetype)initWithArray:(NSArray *)array andDisplayKey:(NSString *)key andTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        CGRect frame = [[UIScreen mainScreen] bounds];
        frame.origin.x = 30;
        frame.origin.y = 80;
        frame.size.width -= (30 * 2);
        frame.size.height -= (80 * 2);
        CGFloat height = frame.size.height;
        CGFloat maxHeight = array.count * 44;
        if (title) {
            maxHeight += 40;
        }
        if (maxHeight < height) {
            height = maxHeight;
        }
        frame.size.height = height;
        self.frame = frame;
        self.items = [array copy];
        self.key = key;
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self addSubview:self.tableView];
        
        if (title) {
            UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 40)];
            UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 8, headerView.frame.size.width - 16 * 2, headerView.frame.size.height - 8 * 2)];
            titleLabel.textColor = [UIColor colorWithRed:19/255.0 green:19/255.0 blue:19/255.0 alpha:1.0];
            titleLabel.font = [UIFont boldSystemFontOfSize:15];
            titleLabel.text = title;
            [headerView addSubview:titleLabel];
            
            UIImageView * separatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, headerView.frame.size.height - 1, headerView.frame.size.width, 1)];
            separatorImageView.image = [UIImage imageNamed:@"cell_separator"];
            [headerView addSubview:separatorImageView];
            
            self.tableView.tableHeaderView = headerView;
        }
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 3;
        self.layer.borderColor = [[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0] CGColor];
        self.layer.borderWidth = 1;
        
        _overlayView = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _overlayView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:0.5];
        [_overlayView addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        UIImageView * separatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, cell.contentView.frame.size.height - 1, cell.contentView.frame.size.width, 1)];
        separatorImageView.image = [UIImage imageNamed:@"cell_separator"];
        [cell.contentView addSubview:separatorImageView];
        cell.textLabel.textColor = [UIColor colorWithRed:146/255.0 green:146/255.0 blue:146/255.0 alpha:1.0];
    }
    if (self.key) {
        cell.textLabel.text = self.items[indexPath.row][self.key];
    }else{
        cell.textLabel.text = self.items[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_ok) {
        _ok(indexPath.row);
    }
    [self hide];
}

#pragma mark - 显示方法
- (void)show
{
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:_overlayView];
    [keywindow addSubview:self];
    
    self.center = CGPointMake(keywindow.bounds.size.width/2.0f,
                              keywindow.bounds.size.height/2.0f);
    [self fadeIn];
    [self.tableView reloadData];
}

- (void)hide
{
    [self fadeOut];
}

- (void)fadeIn
{
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
}
- (void)fadeOut
{
    [UIView animateWithDuration:.35 animations:^{
        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [_overlayView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
}

- (void)showWithCompletion:(CompletionBlockIndex)block
{
    _ok = block;
    [self show];
}

@end
