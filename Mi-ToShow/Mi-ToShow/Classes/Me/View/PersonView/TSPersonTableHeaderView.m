//
//  TSPersonTableHeaderView.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/20.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSPersonTableHeaderView.h"

@interface TSPersonTableHeaderView ()

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;


@end

@implementation TSPersonTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    self.iconBtn.clipsToBounds = YES;
    self.iconBtn.layer.cornerRadius = 80 * 0.5;
    self.editBtn.clipsToBounds = YES;
    self.editBtn.layer.cornerRadius = self.editBtn.height * 0.5;
}

+ (instancetype)tableHeaderView {
    return [[[NSBundle mainBundle] loadNibNamed:@"TSPersonTableHeaderView" owner:self options:nil] lastObject];
}

@end
