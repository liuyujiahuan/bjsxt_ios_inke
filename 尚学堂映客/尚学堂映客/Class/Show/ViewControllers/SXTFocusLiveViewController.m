//
//  SXTFocusLiveViewController.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/22.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTFocusLiveViewController.h"
#import "SXTPlayerViewController.h"
#import "SXTHotLiveCell.h"
#import "SXTCreator.h"

@interface SXTFocusLiveViewController ()

@property (nonatomic, strong) NSMutableArray * dataList;

@end

@implementation SXTFocusLiveViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SXTHotLiveCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"SXTHotLiveCell" owner:self options:nil] lastObject];
    
    cell.live = self.dataList[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70 + self.view.bounds.size.width + 10;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    SXTPlayerViewController * playerVC = [[SXTPlayerViewController alloc] init];
    playerVC.live = self.dataList[indexPath.row];
    [self.navigationController pushViewController:playerVC animated:YES];
    
}

- (NSMutableArray *)dataList {
    
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}


- (void)viewDidLoad {
    [super viewDidLoad];
 
    SXTLive * live = [[SXTLive alloc] init];
    SXTCreator * creator = [[SXTCreator alloc] init];
    live.creator = creator;

    live.streamAddr = Live_Dahuan;
    live.city = @"北京";
    live.onlineUsers = 100;
    live.creator.nick = @"大欢";
    [self.dataList addObject:live];
    
}


@end
