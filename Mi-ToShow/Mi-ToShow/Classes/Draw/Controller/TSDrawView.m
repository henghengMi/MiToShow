//
//  TSDrawView.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/29.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSDrawView.h"
#import "TSBezierPath.h"
@interface TSDrawView ()
{
    BOOL _isErasering;
}

@property(nonatomic, strong) NSMutableArray *lines;
//@property(nonatomic, strong) TSBezierPath *lastPath;
@property(nonatomic, strong) NSMutableArray *lastLines;

@end

@implementation TSDrawView

- (NSMutableArray *)lastLines
{
    if (!_lastLines) {
        _lastLines = [NSMutableArray array];
    }
    return _lastLines;
}

- (NSMutableArray *)lines
{
    if (!_lines) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
           // 初始化
        self.backgroundColor = [UIColor whiteColor];
        self.lineWidthType = LineWidthTypeCenter;
        self.pathColor = [UIColor blackColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // 采取的是遍历拿出每个path然后画上去。
    for (TSBezierPath  *path in self.lines) {
        [path.pathColor set];
        [path stroke];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 拿出手势
    UITouch *touch = [touches anyObject];
    CGPoint beginPoint = [touch locationInView:touch.view];
    TSBezierPath *beginPath = [[TSBezierPath alloc] init];
    [beginPath moveToPoint:beginPoint];
    beginPath.lineCapStyle = kCGLineCapRound;
    beginPath.lineJoinStyle = kCGLineJoinBevel;
    beginPath.lineWidth = self.lineW;
    beginPath.pathColor = self.pathColor;
    [self.lines addObject:beginPath];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint movePoin =  [touch locationInView:touch.view];
    TSBezierPath *movePath = [self.lines lastObject];
    movePath.lineCapStyle = kCGLineCapRound;
    movePath.lineJoinStyle = kCGLineJoinBevel;
    movePath.lineWidth = self.lineW;
    movePath.pathColor = self.pathColor;
    [movePath addLineToPoint:movePoin];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}


#pragma mark - 功能
- (void)setLineWidthType:(LineWidthType)lineWidthType
{
    _lineWidthType = lineWidthType;
    if (_isErasering) {
        self.pathColor =  [UIColor whiteColor];
         _isErasering = NO;
    } else
    {
        self.pathColor =  [UIColor blackColor];
       
    }
    if (lineWidthType == LineWidthTypeSmall) {
        self.lineW = 1;
        
    }else if (lineWidthType == LineWidthTypeCenter)
    {
        self.lineW = 4;
        
    }else if (lineWidthType == LineWidthTypeBig)
    {
        self.lineW = 8;
    }
}
// 撤销
- (BOOL)back
{
    if(self.lines.count){
        [self.lastLines addObject:[self.lines lastObject]];
        [self.lines removeLastObject];
        [self setNeedsDisplay];
        return YES;
    }
    else
    {
        return NO;
    }
}
// 清空
-(void)clear
{
    [self.lines removeAllObjects];
    [self setNeedsDisplay];
}
// 橡皮擦
- (void)eraser
{
//    self.pathColor = [UIColor whiteColor];
    _isErasering = YES;
    self.lineWidthType =  LineWidthTypeBig;
  
}

- (int)forward
{
    if (self.lastLines.count) {
        [self.lines addObject:[self.lastLines lastObject]];
        [self.lastLines removeLastObject];
        [self setNeedsDisplay];
        
        if (self.lastLines.count == 0) { // 如果返回1 证明数组个数为0，所以不能点
            return 1;
        }else
        {
            return 0;
        }
    }
    return 1;
}

    


@end
