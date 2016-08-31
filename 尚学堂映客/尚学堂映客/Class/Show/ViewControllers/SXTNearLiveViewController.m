//
//  SXTNearLiveViewController.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/22.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTNearLiveViewController.h"
#import "SXTHotLiveHandler.h"
#import "SXTNearLiveCell.h"
#import "SXTPlayerViewController.h"

#define kItemSizeW 100
#define kMargin 5

static NSString * identifier = @"SXTNearLiveCell";

@interface SXTNearLiveViewController ()<UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray * dataList;

@end

@implementation SXTNearLiveViewController

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat outInset = self.view.width - 2 * kMargin;
    NSInteger count = outInset / kItemSizeW;
    NSInteger extraTotal = (NSInteger)(outInset - kMargin * (count - 1 ));
    
    CGFloat itemWH;
    
    if (extraTotal < count * kItemSizeW) {
        
        itemWH = extraTotal / count;

    } else {
       
        CGFloat extraWidth = extraTotal % kItemSizeW;
        itemWH = kItemSizeW + extraWidth / count;
    }

    return CGSizeMake(itemWH, itemWH + 25);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SXTNearLiveCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.live = self.dataList[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SXTPlayerViewController * playerVC = [[SXTPlayerViewController alloc] init];
    
    playerVC.live = self.dataList[indexPath.row];
    
    [self.navigationController pushViewController:playerVC animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SXTNearLiveCell * c = (SXTNearLiveCell *)cell;
    [c showAnimation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"SXTNearLiveCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    
    [self loadData];
    
}

- (void)loadData {
    
    [SXTHotLiveHandler executeNearLiveTaskWithSuccess:^(id obj) {
        
        self.dataList = obj;
        [self.collectionView reloadData];
        
    } failed:^(id obj) {
        
        NSLog(@"%@",obj);
    }];
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
