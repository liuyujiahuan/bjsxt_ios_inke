//
//  AppDelegate.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/16.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "AppDelegate.h"
#import "SXTTabBarController.h"
#import "SXTLoginViewController.h"
#import "NSString+CachePath.h"
#import "SXTCacheHelper.h"
#import "SXTAdvertiseView.h"
#import "AppDelegate+SXTUMeung.h"
#import "SXTUserHelper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //设置友盟
    [self setupUmeng];
    
    UIViewController * mainVC ;
    
    if ([SXTUserHelper isAutoLogin]) {
        
        mainVC = [[SXTTabBarController alloc] init];

    } else {
        mainVC = [[SXTLoginViewController alloc] init];

    }
    
    self.window.rootViewController = mainVC;
    
    [self.window makeKeyAndVisible];
    
    
    //载入广告
    SXTAdvertiseView * adverVC = [SXTAdvertiseView loadAdvertiseView];
    [self.window addSubview:adverVC];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}





@end
