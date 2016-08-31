//
//  NSString+CachePath.m
//  01-图片下载
//
//  Created by 大欢 on 16/7/28.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "NSString+CachePath.h"

@implementation NSString (CachePath)

- (NSString *)cacheWithPath {
    
    NSString * sandbox = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    return [sandbox stringByAppendingPathComponent:self];
}

@end
