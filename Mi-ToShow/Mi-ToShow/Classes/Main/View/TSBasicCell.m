//
//  TSBasicCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/19.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSBasicCell.h"

@interface TSBasicCell ()


@end

@implementation TSBasicCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        [self setupData];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setupData];
}

-(void)setupData
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    TSCellBottomLine * bottomLine = [[TSCellBottomLine alloc] init];
    [self.contentView addSubview:bottomLine];
    self.bottomLine = bottomLine;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bottomLine.frame = CGRectMake(15, self.height - 5,ScreenWidth - 2 * 15 , 5);
    
}

@end
