//
//  AppDelegate+SXTUMeung.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/31.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "AppDelegate+SXTUMeung.h"

@implementation AppDelegate (SXTUMeung)

- (void)setupUmeng {
    
    //设置umengkey
    [UMSocialData setAppKey:@"57a5581267e58e2557001639"];
    //RedirectURL 授权回调页
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"2892166685"
                                              secret:@"7849eb7a9922c4318b1a0cff9a215ff3"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
}

@end
