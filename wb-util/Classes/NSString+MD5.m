//
//  NSString+MD5.m
//  Xcode7Test
//
//  Created by zdsoft on 15/12/1.
//  Copyright © 2015年 zdsoft. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

-(NSString *)md5
{
    const char * cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString * hash = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [hash appendFormat:@"%02X", result[i]];
    }
    return [hash lowercaseString];
}

@end
