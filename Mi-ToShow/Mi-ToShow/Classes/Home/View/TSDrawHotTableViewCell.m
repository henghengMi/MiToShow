//
//  TSDrawHotTableViewCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/12.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSDrawHotTableViewCell.h"
#import "TSWork.h"
@interface TSDrawHotTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *originImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *countBtn;

@property (weak, nonatomic) IBOutlet UIImageView *imgView1;
@property (weak, nonatomic) IBOutlet UIImageView *imgView2;
@property (weak, nonatomic) IBOutlet UIImageView *imgView3;

@end

@implementation TSDrawHotTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setDrawTopic:(DrawTopic *)drawTopic
{
    _drawTopic = drawTopic;
    
    NSArray *works = drawTopic.works;
    
    
    [self.originImageView setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",TSImageHost,drawTopic.pngurl]]];
    self.titleLabel.text = drawTopic.topictitle;
    self.subTitleLabel.text = [NSString stringWithFormat:@"题主：%@",drawTopic.user.nickname] ;
    [self.countBtn setTitle:drawTopic.topicworkcount forState:(UIControlStateNormal)];
    
    
    // 下面三个图
    TSWork *work1 = nil;
    TSWork *work2 = nil;
    TSWork *work3 = nil;
    if (works.count) {
        
        if (works.count == 1) {
            work1 = works[0];
            [self.imgView1 setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",TSImageHost,work1.pngurl]]];


        }else if (works.count == 2)
        {   work1 = works[0];
             work2 = works[1];
            [self.imgView1 setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",TSImageHost,work1.pngurl]]];
            [self.imgView2 setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",TSImageHost,work2.pngurl]]];
        }else if (works.count == 3)
        {
            work1 = works[0];
            work2 = works[1];
            work3 = works[2];
            [self.imgView1 setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",TSImageHost,work1.pngurl]]];
            [self.imgView2 setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",TSImageHost,work2.pngurl]]];
            [self.imgView3 setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",TSImageHost,work3.pngurl]]];
        }
    }


    
    
}


@end
