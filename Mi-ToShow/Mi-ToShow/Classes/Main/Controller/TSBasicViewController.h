//
//  TSBasicViewController.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TSBasicViewController : UIViewController


@property(nonatomic, strong) NSMutableArray * dataArray ;



// 导航栏
@property(nonatomic,copy)NSString * TSNavTitle;
@property(nonatomic, copy) NSString * TSNavLeftImageName ;
@property(nonatomic, copy) NSString * TSNavRightImageName ;
@property(nonatomic, copy) NSString * TSNavLeftTitle ;
@property(nonatomic, copy) NSString * TSNavRightTitle ;
@property(nonatomic, copy) UIScrollView * scrollView ;




@property(nonatomic, assign,getter=isTSNavOnleftTitle) BOOL TSNavOnleftTitle;


-(void)setupNavgation;

-(void)TSNavLeftImageDidClick;
-(void)TSNavRightImageDidClick;
-(void)TSNavLeftTitleDidClick;
-(void)TSNavRightTitleDidClick;
- (void)TSNavLeftTitleDidClick_Custom;
- (void)TSNavRightTitleDidClick_Custom;

- (void)setupChildControllerWithLeftControllerClass:(Class)leftControlleClass RightControllerClass:(Class)rightControllerClass;

-(void)headerWithRefreshingWithView:(UIScrollView *)view Target:(id)target refreshingAction:(SEL)action;



@end
