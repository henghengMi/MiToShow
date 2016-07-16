//
//  UICollectionFootView.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/16.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSLeftTitleRightImageButton.h"

@interface TSCollectionFootView : UICollectionReusableView

@property(nonatomic, strong) NSIndexPath * indexPath;
@property(nonatomic, weak) TSLeftTitleRightImageButton *btn;
@end
