//
//  TSCareCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/27.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSCareCell.h"

#import "TSCareCommentsView.h"

@interface TSCareCell ()

{
    BOOL _didExcute;
    int idx ;
}

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *differTime;
@property (weak, nonatomic) IBOutlet UIButton *stateBtn;
@property (weak, nonatomic) IBOutlet UIButton *workBtn;
@property (weak, nonatomic) IBOutlet TSCareCommentsView *commentsView;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *revertBtn;

@end


@implementation TSCareCell

- (IBAction)shareBtnClick:(id)sender {
}
- (IBAction)likeClick:(id)sender {
}
- (IBAction)commentClick:(id)sender {
}
- (IBAction)reverClick:(id)sender {
}


+ (instancetype)careCell
{
    return [[[NSBundle mainBundle] loadNibNamed:@"TSCareCell" owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconBtn.clipsToBounds = YES;
    self.iconBtn.layer.cornerRadius = self.iconBtn.size.height * 0.5;

    
//     NSLog(@"CGRectGetMaxY(self.commentBtn.frame) + 15:%f",CGRectGetMaxY(self.commentBtn.frame) + 15);
//    NSLog(@"CGRectGetMaxY(self.workBtn.frame):%f",CGRectGetMaxY(self.workBtn.frame) );
//    NSLog(@"CGRectGetMaxY(self.workBtn.frame):%f",CGRectGetMaxY(self.workBtn.frame) );
}



- (void)setComments:(NSArray *)comments
{
    _comments= comments;

    
    // 只要set过就不set了。
    if (_didExcute == YES)  return ;
    
    self.commentsView.comments = comments;
    _didExcute = YES;
    
//    NSInteger count = self.commentsView.comments.count ;
//    self.commentsView.height = count * 15 + (count - 1) * 5 + 2*8;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
}


@end
