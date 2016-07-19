//
//  TSDrawNewCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/13.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSDrawNewCell.h"



@interface TSDrawNewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *originImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *countBtn;
@end

@implementation TSDrawNewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setDrawTopic:(DrawTopic *)drawTopic
{
    _drawTopic = drawTopic;
    
//    [self.originImageView setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",TSImageHost,drawTopic.pngurl]]];
    [self.originImageView ts_setImageWithURLString:drawTopic.pngurl imageWidthAndHeight:40];
    
    
    self.titleLabel.text = drawTopic.topictitle;
    self.subTitleLabel.text = [NSString stringWithFormat:@"题主：%@",drawTopic.user.nickname] ;
    [self.countBtn setTitle:drawTopic.topicworkcount forState:(UIControlStateNormal)];
    
}


@end
