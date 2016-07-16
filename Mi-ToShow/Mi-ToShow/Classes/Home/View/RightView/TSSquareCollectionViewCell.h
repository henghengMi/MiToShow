//
//  TSSquareCollectionViewCell.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/15.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawTopic.h"

@interface TSSquareCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong)  DrawTopic * drawTopic;


@property(nonatomic, copy) NSString * imgName;

@end
