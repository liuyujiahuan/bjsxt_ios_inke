//
//  SXTHotLiveCell.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/22.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTHotLiveCell.h"

@interface SXTHotLiveCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *onLineUserLabel;
@property (weak, nonatomic) IBOutlet UIImageView *portraitImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;


@end

@implementation SXTHotLiveCell

- (void)setLive:(SXTLive *)live {
    
    _live = live;
    
    self.nameLabel.text = live.creator.nick;
    self.cityLabel.text = live.city;
    self.onLineUserLabel.text = [@(live.onlineUsers) stringValue];
    
    if ([live.creator.nick isEqualToString:@"大欢"]) {
        
        self.portraitImageView.image = [UIImage  imageNamed:@"dahuan.png"];
        self.bigImageView.image = [UIImage  imageNamed:@"dahuan.png"];
        
    } else {
        
        [self.portraitImageView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
        [self.bigImageView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    }
    
    


}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.portraitImageView.layer.cornerRadius = CGRectGetWidth(self.portraitImageView.frame) / 2;
    self.portraitImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

