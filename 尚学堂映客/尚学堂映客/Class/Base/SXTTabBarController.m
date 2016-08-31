//
//  SXTTabBarController.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/16.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTTabBarController.h"
#import "SXTLaunchViewController.h"
#import "SXTNavigationController.h"
#import "SXTTabbar.h"

@interface SXTTabBarController ()<SXTTabbarDelegate>

@property (nonatomic, strong) SXTTabbar * sxtTabbar;

@end

@implementation SXTTabBarController

#pragma mark - SXTTabbarDelegate

- (void)tabbar:(SXTTabbar *)tabbar clickIndex:(SXTItemType)idx {
    
    if (idx != SXTItemTypeLaunch) {
        //当前tabbar的索引
        self.selectedIndex = idx - SXTItemTypeLive;
        return;
    }
    
    SXTLaunchViewController * launchVC = [[SXTLaunchViewController alloc] init];
    
    [self presentViewController:launchVC animated:YES completion:nil];
}

#pragma mark - getters and setters

- (SXTTabbar *)sxtTabbar {
    
    if (!_sxtTabbar) {
        _sxtTabbar = [[SXTTabbar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _sxtTabbar.delegate = self;
    }
    return _sxtTabbar;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //加载所有视图控制器
    [self configViewControllers];
    
    //加载自定义tabbar
    [self.tabBar addSubview:self.sxtTabbar];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];

}

#pragma mark - privte methods

- (void)configViewControllers {
    
    NSMutableArray * viewControlNames = [NSMutableArray arrayWithArray:@[@"SXTMainViewController",@"SXTMeViewController"]];
    
    for (NSUInteger i = 0; i < viewControlNames.count; i ++) {
        
        NSString * controllerName = viewControlNames[i];
        
        UIViewController * vc = [[NSClassFromString(controllerName) alloc] init];
        
        SXTNavigationController * nav = [[SXTNavigationController alloc] initWithRootViewController:vc];
        
        [viewControlNames replaceObjectAtIndex:i withObject:nav];
    }
    
    self.viewControllers = viewControlNames;
    
}



@end
