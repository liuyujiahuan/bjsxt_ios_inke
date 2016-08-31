//
//  SXTMeInfoView.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/24.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTMeInfoView.h"

@implementation SXTMeInfoView

+ (instancetype)loadInfoView {
    
    return [[[NSBundle mainBundle] loadNibNamed:@"SXTMeInfoView" owner:self options:nil] lastObject];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
