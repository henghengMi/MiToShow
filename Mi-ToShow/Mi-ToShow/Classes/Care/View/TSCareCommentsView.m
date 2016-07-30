//
//  TSCareCommentsView.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/27.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSCareCommentsView.h"

@interface TSCareCommentsView ()
{
    CGFloat _lastLabelMaxY;
}
@property(nonatomic, weak) UITextView * tv;

@end

@implementation TSCareCommentsView

- (void)awakeFromNib
{
    self.backgroundColor = TSColor(243, 243, 243);
    
    UITextView * tv = [[UITextView alloc] init];
    [self addSubview:tv];
    self.tv = tv;
    tv.textColor = [UIColor blackColor];
    tv.backgroundColor = [UIColor cyanColor];
    tv.scrollEnabled = NO;
    tv.editable = NO;
}

- (void)setupTextVierwText
{
    
    for (int i = 0; i < self.comments.count; i ++) {
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.text = self.comments[i];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor blackColor];
        label.numberOfLines = 0;
        label.x = 8;
        label.y = _lastLabelMaxY + 8;
        label.width = ScreenWidth - 60 - 10 - 16;
        label.height = [label.text sizeWithFont:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(label.width, MAXFLOAT)].height;
        _lastLabelMaxY = CGRectGetMaxY(label.frame);
//        label.backgroundColor = [UIColor blackColor];
    }
}

- (void)setComments:(NSArray *)comments
{
    _comments = comments;
    [self setupTextVierwText];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
