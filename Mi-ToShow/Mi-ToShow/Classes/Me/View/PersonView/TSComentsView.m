//
//  TSComentsView.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/26.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSComentsView.h"

#import "TSComment.h"

@interface TSComentsView ()

@property(nonatomic, weak)   UITextView *tv;

@end

@implementation TSComentsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITextView *tv = [[UITextView alloc] init];
        [self addSubview:tv];
        self.tv = tv;
        tv.font = [UIFont systemFontOfSize:12];
        tv.scrollEnabled = NO;
//        tv.textColor = [UIColor grayColor];
        tv.backgroundColor = TSColor(243, 243, 243);
    }
    return self;
}



- (void)setComments:(NSArray *)comments
{
    _comments = comments;
    
//    CGFloat marigin = 8;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;// 字体的行间距
    NSMutableString *mStr = [NSMutableString string];
    NSMutableArray *ranges = [NSMutableArray array];
    
    for (int i = 0; i < comments.count; i++) { // 记录范围
        TSComment *comment = comments[i];
        NSString *oneCommon = [NSString stringWithFormat:@"%@：%@",comment.user.nickname,comment.content];
        NSRange range = NSMakeRange(mStr.length + comment.user.nickname.length + 1, comment.content.length);
        [mStr appendString:oneCommon];
        if (i != comments.count - 1) {
            [mStr appendString:@"\n"];
        }
        // 范围数组
        [ranges addObject:[NSValue valueWithRange:range]];
    }
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:mStr];
    
    // 定义灰色
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, mStr.length)];
    // 范围变色
    for (int i= 0; i < comments.count ; i++) {
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:[ranges[i] rangeValue]];
    }
    // 行距
    [attStr addAttributes:@{
                            NSFontAttributeName:[UIFont systemFontOfSize:12],
                            NSParagraphStyleAttributeName:paragraphStyle
                            } range:NSMakeRange(0, mStr.length)];

    self.tv.attributedText = attStr;
    
//    CGFloat height = [mStr sizeWithFont:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(ScreenWidth - 10 - 60 - 2 * marigin, MAXFLOAT)].height;
    self.tv.height = self.height;
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tv.frame = CGRectMake(0, 0, self.width,self.height);
    
    
}

@end
