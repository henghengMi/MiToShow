//
//  TSPersonSubSetCollectionViewCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/22.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSPersonSubSetCollectionViewCell.h"

@interface TSPersonSubSetCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;


@end

@implementation TSPersonSubSetCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSubset:(TSSubSet *)subset
{
    _subset = subset;
    
    
    
    
    
}

@end
