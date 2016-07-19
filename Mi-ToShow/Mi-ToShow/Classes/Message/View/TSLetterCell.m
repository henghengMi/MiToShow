//
//  TSLetterCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/19.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSLetterCell.h"
#import "TSCellBottomLine.h"





@implementation TSLetterCell

- (void)awakeFromNib
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    [self setupData];
}
-(void)setupData
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    TSCellBottomLine * bottomLine = [[TSCellBottomLine alloc] init];
    [self.contentView addSubview:bottomLine];
//    self.bottomLine = bottomLine;
    bottomLine.frame = CGRectMake(15, 60, ScreenWidth - 30, 5);
    
}

@end
