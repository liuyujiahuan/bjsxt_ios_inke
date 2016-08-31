//
//  SXTMainViewController.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/22.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTMainViewController.h"
#import "SXTHotLiveViewController.h"
#import "SXTNearLiveViewController.h"
#import "SXTFocusLiveViewController.h"
#import "SXTMainTopView.h"

@interface SXTMainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView * contentScrollView;
@property (nonatomic, strong) NSArray * titleNames;

@property (nonatomic, strong) SXTMainTopView * topView;

@end

@implementation SXTMainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self initUI];
    
}


- (void)initUI {
    
    [self setupChildControllers];
    
    [self setupNav];

    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setupNav {
    
    self.navigationItem.titleView = self.topView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStylePlain target:self action:@selector(search:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStylePlain target:self action:@selector(search:)];
}

- (void)setupChildControllers {
    
    NSArray * vcNames = @[@"SXTFocusLiveViewController",@"SXTHotLiveViewController",@"SXTNearLiveViewController"];
    
    for (NSInteger i = 0 ; i < vcNames.count; i ++) {
        
        UIViewController * liveVC = [[NSClassFromString(vcNames[i]) alloc] init];
        liveVC.title = self.titleNames[i];
        [self addChildViewController:liveVC];
    }
    
    self.contentScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * self.titleNames.count, 0);

    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];

}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    //contentScrollView的width
    CGFloat width = SCREEN_WIDTH;//scrollView.frame.size.width;
    
    CGFloat height = SCREEN_HEIGHT;//scrollView.frame.size.height;
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //获取索引
    NSInteger index = offsetX / width;
    
    //标题线
    [self.topView scrolling:index];
    
    UIViewController * childVC = self.childViewControllers[index];
    
    //视图控制器是否加载过
    if ([childVC isViewLoaded]) return;
    
    childVC.view.frame = CGRectMake(offsetX, 0, width, height);
    [scrollView addSubview:childVC.view];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
}

- (SXTMainTopView *)topView {
    
    if (!_topView) {
        
        _topView = [[SXTMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 40) titles:self.titleNames tapView:^(NSInteger tag) {
            
            CGPoint point = CGPointMake(tag * SCREEN_WIDTH ,self.contentScrollView.contentOffset.y);
            
            [self.contentScrollView setContentOffset:point animated:YES];

        }];
    }
    return _topView;
}

- (NSArray *)titleNames {
    
    if (!_titleNames) {
        _titleNames = @[@"关注",@"热门",@"附近"];
    }
    return _titleNames;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
