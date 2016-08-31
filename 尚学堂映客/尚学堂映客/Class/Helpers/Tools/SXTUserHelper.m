//
//  SXTUserHelper.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/31.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTUserHelper.h"

@interface SXTUserHelper ()

@end

@implementation SXTUserHelper

+ (instancetype)sharedUser {
    
    static SXTUserHelper * userhelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userhelper = [[SXTUserHelper alloc] init];
    });
    return userhelper;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        _iconUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconUrl"];

    }
    return self;
}

+ (BOOL)isAutoLogin {
    
    if ([SXTUserHelper sharedUser].username.length == 0) {
        return NO;
    }
    return YES;
}


+ (void)saveUser {

    
    [[NSUserDefaults standardUserDefaults] setObject:[SXTUserHelper sharedUser].username forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:[SXTUserHelper sharedUser].iconUrl forKey:@"iconUrl"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

@end
