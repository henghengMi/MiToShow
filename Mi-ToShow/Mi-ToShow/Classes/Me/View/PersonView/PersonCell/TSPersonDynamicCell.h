//
//  TSPersonDynamicCell.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/21.
//  Copyright © 2016年 TS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSBasicCell.h"
#import "TSDynamic.h"

#import "TSComentsView.h"

@interface TSPersonDynamicCell : TSBasicCell

@property(nonatomic, strong) TSDynamic * dynamic ;

@property(nonatomic, strong) TSComentsView * commentsView ;



@end
