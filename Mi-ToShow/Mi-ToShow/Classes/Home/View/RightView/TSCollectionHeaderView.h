//
//  TSCollectionHeaderView.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/15.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSSomeOneView.h"

@interface TSCollectionHeaderView : UICollectionReusableView
@property(nonatomic, copy) NSString * imgName;
@property(nonatomic, copy) NSString * titleName;
@property(nonatomic, copy) UIView * recommendView; ;
@property(nonatomic, strong) NSIndexPath * indexPath ;
@property(nonatomic, weak) TSSomeOneView * someoneView;

@end
