//
//  WBGlobalConfig.h
//  AFNetworking
//
//  Created by Pang Weibo on 2019/1/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WBGlobalConfig : NSObject

+ (instancetype)sharedConfig;

@property (nonatomic, copy) NSString * globalURLString;
@property (nonatomic, copy) NSString * globalSecondaryURLString;

@property (nonatomic, copy) NSString * globalImageURLString;
@property (nonatomic, copy) NSString * globalSecondaryImageURLString;

@end

NS_ASSUME_NONNULL_END
