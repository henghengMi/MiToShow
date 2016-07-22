//
//  TSMeHomeCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/19.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSMeHomeCell.h"

@interface TSMeHomeCell ()


@end

@implementation TSMeHomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *numberLabel = [[UILabel alloc] init];
        [self.contentView addSubview:numberLabel];
        self.numberLabel = numberLabel;
        numberLabel.font = [UIFont systemFontOfSize:12];
        numberLabel.textAlignment = NSTextAlignmentRight;
        
        numberLabel.text = @"2";
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.numberLabel.frame = CGRectMake(self.width - 15 - 8 - 10 - 100, (self.height - 13) * 0.5, 100, 13);
}



@end
