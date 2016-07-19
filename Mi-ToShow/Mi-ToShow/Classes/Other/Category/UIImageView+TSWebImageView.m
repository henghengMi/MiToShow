//
//  UIImageView+TSWebImageView.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/19.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "UIImageView+TSWebImageView.h"

@implementation UIImageView (TSWebImageView)

- (void)ts_setImageWithURLString:(NSString *)urlString imageWidthAndHeight:(int)imageWidthAndHeight
{
     NSLog(@"imageURL:%@",[NSString stringWithFormat:@"%@/%@@1wh_%dw_%dh.jpg",TSImageHost,urlString,imageWidthAndHeight,imageWidthAndHeight]);
    
    [self setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@@1wh_%dw_%dh.jpg",TSImageHost,urlString,imageWidthAndHeight,imageWidthAndHeight]]];
//    [self setImageURL:[NSURL URLWithString:@"http://f.hiphotos.baidu.com/zhidao/pic/item/0b46f21fbe096b634bdfe39b0d338744eaf8ac33.jpg"]];
//    [self setImageURL:[NSURL URLWithString:@"img.toshow.com//work/png/1468639528!vC3XcsQOAIk6BcumpdtqiYMn9Nuegibz.png@1wh_50w_50h.jpg"]];
    
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@@1wh_%dw_%dh.jpg",TSImageHost,urlString,imageWidthAndHeight,imageWidthAndHeight]]];
//    
//    UIImage *img = [UIImage imageWithData:data];
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//         self.image = img;
//    });
   
//    NSURLRequest *requst = [NSURLRequest requestWithURL:[]];
    
}

@end
