//
//  DrawController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSDrawController.h"
#import "TSDrawView.h"
@interface TSDrawController ()

@property(nonatomic, weak) UIButton * menueBtn;
@property(nonatomic, weak) UIButton * arrow;
@property(nonatomic, weak) UIButton * lastSelectedBtn;
@property(nonatomic, weak) TSDrawView * drawView;
@property(nonatomic, weak) UIButton * forwardBtn;
@end

@implementation TSDrawController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    [self setupNav];
    [self UI];
}

-(void)UI
{
   TSDrawView * drawView = [[TSDrawView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 60 - 44 - 10 - 70*2)];
    drawView.centerY = self.view.centerY;
    [self.view addSubview:drawView];
    self.drawView = drawView;
    
    UILabel *bbLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 18)];
    bbLabel.textColor = [UIColor randomColor];
    bbLabel.textAlignment = NSTextAlignmentCenter;
//    bbLabel.text = @"卢秀婷是世界上最美的女人";
    bbLabel.font = [UIFont boldSystemFontOfSize:18];
    [drawView addSubview:bbLabel];

    UIView *drawHanddleView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 70, ScreenWidth, 60)];
    [self.view addSubview:drawHanddleView];
    drawHanddleView.backgroundColor = [UIColor blackColor];
    [self setupDrawHanddleViewSubViewWithDrawHanddleView:drawHanddleView];
    
    UIButton *menueBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenHeight - 20, ScreenWidth, 70)];
    [self.view addSubview:menueBtn];
    menueBtn.backgroundColor = [UIColor whiteColor];
    [menueBtn addTarget:self action:@selector(menueBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    self.menueBtn = menueBtn;
    [self addBottomWithMenueBtn:menueBtn];
}
#pragma mark 增加底部按钮
- (void)addBottomWithMenueBtn:(UIButton *)menueBtn
{
    // black-canvas_20
    // black-canvas_19
    
    UIButton *arrow = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20 ,20)];
    [menueBtn addSubview:arrow];
    [arrow setBackgroundImage:IMAGE(@"black-canvas_20") forState:(UIControlStateNormal)];
    [arrow setBackgroundImage:IMAGE(@"black-canvas_19") forState:(UIControlStateSelected)];
    arrow.centerX = menueBtn.centerX;
    self.arrow = arrow;
    arrow.userInteractionEnabled = NO;
    
    CGFloat w = (ScreenWidth  - 2 *20) / 5;
    NSArray *images = @[@"straight_",@"black-canvas_24",@"black-canvas_25",@"black-canvas_22",@"black-canvas_23"];
    for (int i = 0 ; i< 5; i++) {
        UIButton *btn = [UIButton buttonWithType:0];
        btn.frame = CGRectMake(20 + w * i, menueBtn.height - 40, w, 40);
        [menueBtn addSubview:btn];
        [btn setImage:IMAGE(images[i]) forState:(UIControlStateNormal)];
    }
    
}

#pragma mark drawHanddleView
- (void)setupDrawHanddleViewSubViewWithDrawHanddleView:(UIView *)drawHanddleView {
    
    CGFloat w = 50;
    
    UIButton *backBtn = [self getDrawHanddleBtnWithImageName:@"black-canvas_15" selectedImage:@"black-canvas_09" target:self action: @selector(handdleBtnClick:)];
    [drawHanddleView addSubview:backBtn];
    backBtn.frame  = CGRectMake(10, 0, w, 60);
    backBtn.tag = 520;
    backBtn.selected = YES;
    
    UIButton *forwardBtn = [self getDrawHanddleBtnWithImageName:@"black-canvas_16" selectedImage:@"black-canvas_10"  target:self action:@selector(handdleBtnClick:)];
    [drawHanddleView addSubview:forwardBtn];
     forwardBtn.frame  = CGRectMake(CGRectGetMaxX(backBtn.frame) + 10, 0, w, 60);
    forwardBtn.tag = 521;
//    forwardBtn.enabled = YES;
    self.forwardBtn = forwardBtn;
    
    UIButton *smallDotBtn = [self getDrawHanddleBtnWithImageName:@"black-canvas_05" selectedImage:@"black-canvas_01" target:self action:@selector(handdleBtnClick:)];
    [drawHanddleView addSubview:smallDotBtn];
    smallDotBtn.frame  = CGRectMake(0,0, w, 60);
    smallDotBtn.centerX = self.view.centerX;
    smallDotBtn.tag = 522;
    
    CGFloat rightW = (ScreenWidth * 0.5 - smallDotBtn.width * 0.5) / 3;
    UIButton *centerDotBtn = [self getDrawHanddleBtnWithImageName:@"black-canvas_06" selectedImage:@"black-canvas_02" target:self action:@selector(handdleBtnClick:)];
    [drawHanddleView addSubview:centerDotBtn];
    centerDotBtn.frame = CGRectMake(CGRectGetMaxX(smallDotBtn.frame) , 0, rightW, 60);
       centerDotBtn.tag = 523;
    
    UIButton *bigDotBtn = [self getDrawHanddleBtnWithImageName:@"black-canvas_07" selectedImage:@"black-canvas_03" target:self action:@selector(handdleBtnClick:)];
    [drawHanddleView addSubview:bigDotBtn];
    bigDotBtn.frame = CGRectMake(CGRectGetMaxX(centerDotBtn.frame) , 0, rightW, 60);
    bigDotBtn.tag = 524;

    
    UIButton *eraserBtn = [self getDrawHanddleBtnWithImageName:@"black-canvas_08" selectedImage:@"black-canvas_04"  target:self action:@selector(handdleBtnClick:)];
    [drawHanddleView addSubview:eraserBtn];
    eraserBtn.frame = CGRectMake(CGRectGetMaxX(bigDotBtn.frame) , 0, rightW, 60);
    eraserBtn.tag = 525;
    
    [self handdleBtnClick:centerDotBtn];

}


- (void)handdleBtnClick:(UIButton *)handdleBtn
{

    // 右边
    if (handdleBtn.tag>= 522) {
        
        if (self.lastSelectedBtn == handdleBtn) return;
        handdleBtn.selected = YES;
        self.lastSelectedBtn.selected = NO;
        self.lastSelectedBtn = handdleBtn;
        
        if (handdleBtn.tag == 525) {
            [self.drawView eraser];
        }else
        {
            // 设置线宽
            self.drawView.lineWidthType = (handdleBtn.tag == 522) ? LineWidthTypeSmall :  (handdleBtn.tag == 523) ?  LineWidthTypeCenter :LineWidthTypeBig;
        }
        
    }else // 左边
    {
        if (handdleBtn.tag == 520) { // 撤销
           BOOL isHaveLines = [self.drawView back];
            if(isHaveLines){
                self.forwardBtn.selected = YES;
            }
            
        }else if (handdleBtn.tag == 521) // 返回撤销前
        {
           int i =  [self.drawView forward];
            handdleBtn.selected = !i;
        }
    }
}

- (UIButton *)getDrawHanddleBtnWithImageName:(NSString *)imageName  selectedImage:(NSString *)selectedImageName target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:0];
    [btn setImage:IMAGE(imageName) forState:(UIControlStateNormal)];
//     [btn setImage:IMAGE(selectedImageName) forState:(UIControlStateHighlighted)];
    [btn addTarget:target action:action forControlEvents:(UIControlEventTouchDown)];
    [btn setImage:IMAGE(selectedImageName) forState:(UIControlStateSelected)];
    btn.adjustsImageWhenHighlighted = NO;
    return btn;
}

- (UIButton *)getDrawHanddleBtnWithImageName:(NSString *)imageName  disableImageName:(NSString *)disableImageName target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:0];
    [btn setImage:IMAGE(imageName) forState:(UIControlStateNormal)];
    //     [btn setImage:IMAGE(selectedImageName) forState:(UIControlStateHighlighted)];
    [btn addTarget:target action:action forControlEvents:(UIControlEventTouchDown)];
    [btn setImage:IMAGE(disableImageName) forState:(UIControlStateDisabled)];
    btn.adjustsImageWhenHighlighted = NO;
    return btn;
}

- (UIButton *)getDrawHanddleBtnWithImageName:(NSString *)imageName  action:(SEL)action
{
    return [self getDrawHanddleBtnWithImageName:imageName selectedImage:nil target:self action:action];
}

- (void)menueBtnClick:(UIButton *)menueBtn {
    if (menueBtn.tag == 0) {
        self.arrow.selected = YES;
        [UIView animateWithDuration:0.25 animations:^{
            menueBtn.transform = CGAffineTransformMakeTranslation(0, -50);
        } completion:^(BOOL finished) {
            menueBtn.tag = 520;
        }];
    }else if (menueBtn.tag == 520)
    {
        self.arrow.selected = NO;
        
        [UIView animateWithDuration:0.25 animations:^{
            
            menueBtn.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            menueBtn.tag = 0;
        }];
    }
}

- (void)setupNav
{
    self.TSNavLeftImageName = @"black-canvas_13";
    self.TSNavRightImageName = @"black-canvas_14";
}

- (void)TSNavLeftImageDidClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
