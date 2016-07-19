
//
//  TSMessageMeCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/19.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSMessageMeCell.h"


@implementation TSMessageMeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        
        
        UIImageView *imgView  = [[UIImageView alloc] init];
        [self.contentView addSubview:imgView];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        
    
        
    }
    return self;
}

@end
