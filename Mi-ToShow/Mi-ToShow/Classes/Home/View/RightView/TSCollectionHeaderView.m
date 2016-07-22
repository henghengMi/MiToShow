//
//  TSCollectionHeaderView.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/15.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSCollectionHeaderView.h"
@interface TSCollectionHeaderView ()

@property(nonatomic, weak) UIButton * headerBtn;


@end

@implementation TSCollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 最新画题或者最热话题的头部。
        UIButton * headerBtn = [UIButton buttonWithType:0];
        headerBtn.frame = CGRectMake(TSLefrMargin,  0 , ScreenWidth - 2 * TSLefrMargin, 35);
        [self addSubview:headerBtn];
        headerBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [headerBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        headerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        headerBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        headerBtn.userInteractionEnabled = NO;
        self.headerBtn = headerBtn;
        headerBtn.backgroundColor = [UIColor whiteColor];
        
        
        TSSomeOneView * someoneView = [[TSSomeOneView  alloc] init];
        someoneView.frame = CGRectMake(0, 0, ScreenWidth, 65);
        self.someoneView = someoneView;
        [self addSubview:someoneView];
        someoneView.backgroundColor = [UIColor whiteColor];
        
        UIView *dividerView = [[UIView alloc] initWithFrame:CGRectMake(0, 55, ScreenWidth, 10)] ;
        [someoneView addSubview:dividerView];
        dividerView.backgroundColor = [UIColor TSSectionColor];
    }
    
    return self;
}



- (void)setImgName:(NSString *)imgName
{
    _imgName = [imgName copy];
    [self.headerBtn setImage:IMAGE(imgName) forState:(UIControlStateNormal)];
}

- (void)setTitleName:(NSString *)titleName
{
    _titleName = [titleName copy];
    [self.headerBtn setTitle:titleName forState:(UIControlStateNormal)];
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    self.someoneView.hidden = !(indexPath.section == 0) ;
    self.headerBtn.y = (indexPath.section == 0) ? 70 : 5;
}

- (void)setImages:(NSArray *)images
{
    _images = images;
    self.someoneView.images = images;
    
    
    
}



@end
