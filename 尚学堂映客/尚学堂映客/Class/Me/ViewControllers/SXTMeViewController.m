//
//  SXTMeViewController.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/16.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTMeViewController.h"
#import "SXTMeInfoView.h"
#import "SXTSetting.h"

@interface SXTMeViewController ()

@property (nonatomic, strong) SXTMeInfoView * infoView;

@property (nonatomic, strong) NSMutableArray * dataList;

@end

@implementation SXTMeViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear: animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (SXTMeInfoView *)infoView {
    
    if (!_infoView) {
        _infoView = [SXTMeInfoView loadInfoView];
    }
    return _infoView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    [self loadData];

}

- (void)initUI {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.rowHeight = 60;
    self.tableView.sectionFooterHeight = 5;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
}

- (void)loadData {
    
    SXTSetting * set1 = [[SXTSetting alloc] init];
    set1.title = @"映客贡献榜";
    set1.subtitle = @"";
    set1.vcName = @"";
    
    SXTSetting * set2 = [[SXTSetting alloc] init];
    set2.title = @"收益";
    set2.subtitle = @"0映票";
    set2.vcName = @"";
    
    SXTSetting * set3 = [[SXTSetting alloc] init];
    set3.title = @"账户";
    set3.subtitle = @"0钻石";
    set3.vcName = @"";
    
    SXTSetting * set4 = [[SXTSetting alloc] init];
    set4.title = @"等级";
    set4.subtitle = @"3级";
    set4.vcName = @"";
    
    SXTSetting * set5 = [[SXTSetting alloc] init];
    set5.title = @"实名认证";
    set5.subtitle = @"";
    set5.vcName = @"";
    
    SXTSetting * set6 = [[SXTSetting alloc] init];
    set6.title = @"设置";
    set6.subtitle = @"";
    set6.vcName = @"";
    
    
    NSArray * arr1 = @[set1,set2,set3];
    NSArray * arr2 = @[set4,set5];
    NSArray * arr3 = @[set6];
    self.dataList = [@[arr1,arr2,arr3] mutableCopy];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray * arr = self.dataList[section];
    
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    SXTSetting * set = self.dataList[indexPath.section][indexPath.row];
    
    cell.textLabel.text = set.title;
    cell.textLabel.textColor = [UIColor grayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.detailTextLabel.text = set.subtitle;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return self.infoView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return SCREEN_HEIGHT / 2;
    }
    
    return 0.1;
}

- (NSMutableArray *)dataList {
    
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}


@end
