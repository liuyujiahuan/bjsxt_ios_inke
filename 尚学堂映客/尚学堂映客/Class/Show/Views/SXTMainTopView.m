//
//  SXTMainTopView.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/24.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTMainTopView.h"

@interface SXTMainTopView ()

@property (nonatomic, strong) UIView * lineView;

@property (nonatomic, copy) MainTopBlock block;

@property (nonatomic, strong) NSMutableArray * buttons;

@end

@implementation SXTMainTopView

- (NSMutableArray *)buttons {
    
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles tapView:(MainTopBlock)block {
    
    if (self = [super initWithFrame:frame]) {
        
        self.block = block;
    
        CGFloat btnW = self.width / titles.count;
        CGFloat btnH = self.height;
        CGFloat btnX;

        for (int i = 0; i < titles.count; i++) {
            
            UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [self.buttons addObject:titleButton];

            
            titleButton.tag = i;
            
            NSString * vcName = titles[i];
            
            [titleButton setTitle:vcName forState:UIControlStateNormal];
            // 设置标题颜色
            [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            // 设置标题字体
            titleButton.titleLabel.font = [UIFont systemFontOfSize:18];
            
            btnX = i * btnW;
            
            titleButton.frame = CGRectMake(btnX, 0, btnW, btnH);
            
            // 监听按钮点击
            [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:titleButton];
            
            if (i == 1) {
                // 添加下划线
                // 下划线宽度 = 按钮文字宽度
                // 下划线中心点x = 按钮中心点x
                
                CGFloat h = 2;
                CGFloat y = 35 ;
                
                // 先计算文字尺寸,在给label去赋值
                [titleButton.titleLabel sizeToFit];
                
                UIView * lineView =[[UIView alloc] init];
                // 位置和尺寸
                lineView.height = h;
                lineView.width = titleButton.titleLabel.width;
                lineView.centerX = titleButton.centerX;
                lineView.top = y;
                lineView.backgroundColor = [UIColor whiteColor];
                
                self.lineView = lineView;
                
                [self addSubview:self.lineView];
                
            }
        }
    }
    return self;
}


- (void)scrolling:(NSInteger)tag {
    
    UIButton * button = self.buttons[tag];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineView.centerX = button.centerX;
    }];
}

- (void)titleClick:(UIButton *)button {
    
    self.block(button.tag);
    
    [self scrolling:button.tag];
}


@end
