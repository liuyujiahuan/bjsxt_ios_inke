//
//  SXTCacheHelper.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/30.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTCacheHelper.h"

static NSString *const adImageName = @"adImageName";

@implementation SXTCacheHelper

+ (NSString *)getAdvertiseImage {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:adImageName];
}

+ (void)setAdvertiseImage:(NSString *)imageName {
 
    [[NSUserDefaults standardUserDefaults] setObject:imageName forKey:adImageName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
