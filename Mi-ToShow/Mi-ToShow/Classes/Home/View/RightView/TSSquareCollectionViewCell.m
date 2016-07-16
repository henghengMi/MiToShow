//
//  TSSquareCollectionViewCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/15.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSSquareCollectionViewCell.h"

@interface TSSquareCollectionViewCell ()
//@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end


@implementation TSSquareCollectionViewCell

- (void)awakeFromNib
{
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bgView;
    
    //加阴影--任海丽编辑
//    self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
//    self.layer.shadowOffset = CGSizeMake(4,4);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//    self.layer.shadowOpacity = 0.8;//阴影透明度，默认0
//    self.layer.shadowRadius = 4;
    
     NSLog(@"self.bounds %@",NSStringFromCGRect(self.bounds));
    
    CGFloat WH = (ScreenWidth - 4 * 10) / 3;
    CGRect rect =  CGRectMake(0, 0, WH  , WH);
    [self layer].shadowPath =[UIBezierPath bezierPathWithRect:rect].CGPath;
    [self layer].masksToBounds = NO;
    self.layer.shadowColor = TSColor(198, 198, 198).CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(1,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 1.0;//阴影透明度，默认0
    self.layer.shadowRadius = 1;
    
}

- (void)setDrawTopic:(DrawTopic *)drawTopic
{
    _drawTopic = drawTopic;
    
//    [self.imgView setImageURL:[NSURL URLWithString:@"%@"]]  drawTopic.pngurl;
    
}

- (void)setImgName:(NSString *)imgName
{
    _imgName = [imgName copy];
    self.imgView.image = IMAGE(imgName);
}


@end
