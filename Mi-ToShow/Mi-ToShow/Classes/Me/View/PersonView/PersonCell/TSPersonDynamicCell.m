//
//  TSPersonDynamicCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/21.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSPersonDynamicCell.h"
#import "UIView+TSAddShadow.h"
@interface TSPersonDynamicCell ()

@property(nonatomic, weak)  UILabel *dateLabel ;
@property(nonatomic, weak) UIButton * stateBtn;
@property(nonatomic, weak) UIImageView * arrow;

@property(nonatomic, weak) UIButton * deleteBtn;
@property(nonatomic, weak) UILabel * titleLabel;
@property(nonatomic, weak) UIButton * shareBtn;

@property(nonatomic, weak) UIButton * workBtn;
@property(nonatomic, weak) UILabel  *subfeedNameAndTitle ;
@property(nonatomic, weak) UIImageView * workImageView;

@property(nonatomic, weak) UIButton * favoriteCountBtn;
@property(nonatomic, weak) UIButton * commonCountBtn;
@property(nonatomic, weak) UIButton * reveteCountBtn;


@end

@implementation TSPersonDynamicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self UI];
        
    }
    return self;
}


- (void)UI
{
    // 日期
    UILabel *dateLabel  = [[UILabel alloc] init];
    dateLabel.font = [UIFont systemFontOfSize:12];
    self.dateLabel = dateLabel;
    [self.contentView addSubview:dateLabel];
    dateLabel.text =  @"20\n七月";
    dateLabel.textColor = [UIColor blackColor];
    dateLabel.numberOfLines = 2;
    dateLabel.textAlignment = NSTextAlignmentCenter;
    
    
    // 状态
    UIButton * stateBtn = [UIButton buttonWithType:0];
    [self.contentView addSubview:stateBtn];
    self.stateBtn = stateBtn;
    [stateBtn setTitle:@"发表了作品" forState:(UIControlStateNormal)];
    stateBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [stateBtn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
    
    // 状态的右边箭头
    UIImageView *arrow = [[UIImageView alloc] init];
    arrow.image = IMAGE(@"ArrowFeed");
    [self.contentView addSubview:arrow];
    self.arrow = arrow;
    self.arrow.hidden = YES;
    
    // 删除按钮
    UIButton * deleteBtn = [UIButton buttonWithType:0];
    [self.contentView addSubview:deleteBtn];
    self.deleteBtn = deleteBtn;
    [deleteBtn setTitle:@"删除" forState:(UIControlStateNormal)];
    deleteBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [deleteBtn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];

    // 标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text  =  @"标题";
    // 分享按钮
    UIButton * shareBtn = [UIButton buttonWithType:0];
    [self.contentView addSubview:shareBtn];
    self.shareBtn = shareBtn;
    [shareBtn setImage:IMAGE(@"moreFeed") forState:(UIControlStateNormal)];
    
    // 作品
    UIButton *workBtn = [UIButton buttonWithType:0];
    [self.contentView addSubview:workBtn];
    self.workBtn = workBtn;
    workBtn.backgroundColor = TSColor(243, 243, 243);
    [workBtn setImage:IMAGE(@"Mi_02") forState:(UIControlStateNormal)];

    // 转发的姓名和标题
    UILabel *subfeedNameAndTitle = [[UILabel alloc] init];
    [workBtn addSubview:subfeedNameAndTitle];
    self.subfeedNameAndTitle = subfeedNameAndTitle;
    subfeedNameAndTitle.textColor = [UIColor grayColor];
    subfeedNameAndTitle.font = [UIFont systemFontOfSize:12];
    
    // 转发的图片
    UIImageView *workImageView = [[UIImageView alloc] init];
    self.workImageView = workImageView;
    [workBtn addSubview:workImageView];
    workImageView.backgroundColor = [UIColor blackColor];
    
    
    // 喜欢的个数
    UIButton *favoriteCountBtn = [self buttomBtnWithImage:@"unlikepoint" title:@"12"];
    self.favoriteCountBtn = favoriteCountBtn;
    favoriteCountBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    // 评论个数
    UIButton *commonCountBtn = [self buttomBtnWithImage:@"commentFeed" title:@"6"];
    self.commonCountBtn = commonCountBtn;
    
    // 转发个数
    UIButton *reveteCountBtn = [self buttomBtnWithImage:@"transfer" title:@"转发"];
    self.reveteCountBtn = reveteCountBtn;
    reveteCountBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    TSComentsView * commentsView = [[TSComentsView alloc] init];
    [self.contentView addSubview:commentsView];
    self.commentsView = commentsView;
//    commentsView.backgroundColor = [UIColor grayColor];
    self.commentsView.hidden = YES;
    
    // 调试颜色
//    self.arrow.backgroundColor = [UIColor redColor];
//    self.stateBtn.backgroundColor = [UIColor yellowColor];
//    dateLabel.backgroundColor = [UIColor redColor];
}


- (UIButton *)buttomBtnWithImage:(NSString *)image title:(NSString *)title
{
    UIButton * btn = [UIButton buttonWithType:0];
    [self.contentView addSubview:btn];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [btn setImage:IMAGE(image) forState:(UIControlStateNormal)];
    [btn setTitle:title forState:(UIControlStateNormal)];
//    btn.backgroundColor = [UIColor redColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:11];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    
    return btn;
}


- (void)setDynamic:(TSDynamic *)dynamic
{
    _dynamic  = dynamic;
    
    self.titleLabel.text = dynamic.text;
    [self.favoriteCountBtn setTitle:dynamic.praisecount forState:(UIControlStateNormal)];
    [self.commonCountBtn setTitle:dynamic.commentcount forState:(UIControlStateNormal)];
    
    // 参与了话题
    if (dynamic.action) {
        if (dynamic.action.topictitle) {
            NSString *state  = @"参与了画题";
            NSString * topictitle = [NSString stringWithFormat:@"%@\"%@\"",state,_dynamic.action.topictitle];
//            [self.stateBtn setTitle:[NSString stringWithFormat:@"参与了画题\"%@\"",dynamic.action.topictitle] forState:(UIControlStateNormal)];
            NSMutableAttributedString * attstr = [[NSMutableAttributedString alloc] initWithString:topictitle] ;
            [attstr addAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} range:NSMakeRange(0, state.length)];
            [attstr addAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} range:NSMakeRange(state.length,topictitle.length - state.length )];
            [self.stateBtn setAttributedTitle:attstr forState:(UIControlStateNormal)];
            
            self.arrow.hidden = NO;
        }else
        {
            self.arrow.hidden = YES;
        }
    }
    
    // 转发
    if (dynamic.subfeed) {
        self.subfeedNameAndTitle.text = [NSString stringWithFormat:@"%@：%@",dynamic.subfeed.user.nickname,dynamic.subfeed.text];
        [self.workBtn setImage:nil forState:(UIControlStateNormal)];
        self.workBtn.backgroundColor = TSColor(243, 243, 243);
        self.workImageView.image = IMAGE(@"Mi_01");
        [self.stateBtn setTitle:@"转发了画题" forState:(UIControlStateNormal)];

        // 发出人和标题区分字体颜色
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self.subfeedNameAndTitle.text];
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(dynamic.subfeed.user.nickname.length + 1, dynamic.subfeed.text.length)];
        self.subfeedNameAndTitle.attributedText = attStr;
        
    }else
    {
        [self.workBtn addShadow];
    }
    
    // 评论区
    self.commentsView.hidden = !dynamic.comments.count;
    if (dynamic.comments.count) {
        self.commentsView.comments = dynamic.comments;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bottomLine.width = self.width;
    self.bottomLine.x = 0;
    self.dateLabel.frame = CGRectMake(15, 20, 30, 40);
    CGFloat stateBtnW = [@"发表了作品" sizeWithFont:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(MAXFLOAT, 20)].width;
    
  if(_dynamic.action.topictitle)
  {
      NSString *state  = @"参与了画题";
      NSString * topictitle = [NSString stringWithFormat:@"%@\"%@\"",state,_dynamic.action.topictitle];
      stateBtnW = [topictitle sizeWithFont:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(MAXFLOAT, 20)].width;
  }
    self.stateBtn.frame = CGRectMake(CGRectGetMaxX(self.dateLabel.frame) + 15, 15, stateBtnW, 20);
    self.arrow.frame = CGRectMake(CGRectGetMaxX(self.stateBtn.frame) , self.stateBtn.y, 20, 20);
    CGFloat deleteBtnX  = (_dynamic.action.topictitle) ? CGRectGetMaxX(self.arrow.frame) + 20 : CGRectGetMaxX(self.stateBtn.frame) + 20;
    self.deleteBtn.frame = CGRectMake(deleteBtnX, self.stateBtn.y, 30,  self.stateBtn.height);
    self.titleLabel.frame = CGRectMake(self.stateBtn.x, CGRectGetMaxY(self.stateBtn.frame) + 10, ScreenWidth - self.stateBtn.x  * 2, 18);
    self.shareBtn.frame = CGRectMake(ScreenWidth - 30 - 10, 0, 30, 30);
    self.shareBtn.centerY = self.deleteBtn.centerY;
    
    // 转发的处理
    CGFloat workBtnY = (_dynamic.text.length) ? CGRectGetMaxY(self.titleLabel.frame) + 10 : CGRectGetMaxY(self.stateBtn.frame) + 10 ;
    self.workBtn.frame = CGRectMake(self.stateBtn.x, workBtnY, ScreenWidth - 2 * self.stateBtn.x ,  ScreenWidth - 2 * self.stateBtn.x);
    if (_dynamic.subfeed) {
        
        self.workBtn.height = 170;
        self.workBtn.width = ScreenWidth - self.workBtn.x;
        self.subfeedNameAndTitle.frame = CGRectMake(10, 0, self.workBtn.width - 10, 30);
        CGFloat workImageWH = self.workBtn.height - 30 - 10;
        self.workImageView.frame = CGRectMake(10, 30, workImageWH, workImageWH);
    }
    else
    {
        [self.workBtn shaodowByFrame:self.workBtn.bounds];
    }
    
    // 下面三个按钮
    self.favoriteCountBtn.frame = CGRectMake(self.workBtn.x, CGRectGetMaxY(self.workBtn.frame) + 15, 80, 15);
    self.reveteCountBtn.frame = CGRectMake(ScreenWidth - self.favoriteCountBtn.width - 10,  self.favoriteCountBtn.y,  self.favoriteCountBtn.width,  self.favoriteCountBtn.height);
    self.commonCountBtn.frame = CGRectMake((ScreenWidth - 10 - self.favoriteCountBtn.x) * 0.5 + 40 , self.favoriteCountBtn.y, self.favoriteCountBtn.width, self.favoriteCountBtn.height);
    self.commonCountBtn.centerX = (self.favoriteCountBtn.x + CGRectGetMaxX(self.reveteCountBtn.frame)) * 0.5;

    
    NSUInteger commentsCount = _dynamic.comments.count;
    if (commentsCount) {
        self.commentsView.frame = CGRectMake(self.stateBtn.x, CGRectGetMaxY(self.commonCountBtn.frame) + 20, ScreenWidth - self.stateBtn.x - 10, 8 * 2  + 13 * commentsCount + ( (commentsCount -1) * 8) );
        NSLog(@"%@",NSStringFromCGRect(self.commentsView.frame));
    }

    
    // 转发
    // 是转发

//    if (_dynamic.subfeed) {
//        if (_dynamic.text.length) {
//            NSLog(@"转发-有标题-最大Y : %f",CGRectGetMaxY(self.commonCountBtn.frame));
//
//        }else
//        {
//            NSLog(@"转发-无标题-最大Y : %f",CGRectGetMaxY(self.commonCountBtn.frame));
//        }
//    }
//    
//    if (_dynamic.text.length) {
//        NSLog(@"正常-有标题-最大Y : %f",CGRectGetMaxY(self.commonCountBtn.frame));
//
//    }else
//    {
//        NSLog(@"正常-无标题-最大Y : %f",CGRectGetMaxY(self.commonCountBtn.frame));
//    }
    
    
//     NSLog(@"最大Y : %f",CGRectGetMaxY(self.commonCountBtn.frame));
}

@end
