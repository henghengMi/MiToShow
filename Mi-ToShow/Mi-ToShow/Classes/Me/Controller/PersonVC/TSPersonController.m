//
//  TSPersonController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/20.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSPersonController.h"
#import "TSPersonTableHeaderView.h"
#import "TSMeHomeButtonsView.h"
#import "TSPersonWorkView.h"
#import "TSPersonWorkCell.h"
#import "TSPersonTopicCell.h"
#import "TSPersonSubSetCell.h"
#import "TSDynamic.h"
#import "TSWork.h"

@interface TSPersonController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, weak) UITableView * tableView;
@property(nonatomic, weak)  UIView *insertView ;
@property(nonatomic, weak) UIView *navView;
@property(nonatomic, assign) int  currentIndex;
@property(nonatomic, strong)  TSMeHomeButtonsView *btnsView;
@property(nonatomic, strong) NSMutableArray * dynamics;
@property(nonatomic, strong) NSMutableArray * works;
@property(nonatomic, strong) NSMutableArray * subsets;
@end

@implementation TSPersonController

-  (NSMutableArray *)dynamics
{
    if (!_dynamics) {
        _dynamics = [NSMutableArray array];
    }
    return _dynamics;
}

-  (NSMutableArray *)works
{
    if (!_works) {
        _works = [NSMutableArray array];
    }
    return _works;
}


-  (NSMutableArray *)subsets
{
    if (!_subsets) {
        _subsets = [NSMutableArray array];
    }
    return _subsets;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    [self getDynamic];
    [self  getWorks];
    [self getsubSets];
    
    [self setupTableView];
    [self setupTableHeaderView];
    [self setupNav];
    
}

//

#pragma mark requst
- (void)getDynamic
{
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/user/feed?requestcount=15&timestamp=0&uid=580298" success:^(id json) {
        self.dynamics = [TSDynamic mj_objectArrayWithKeyValuesArray:json[@"result"]];
        TSLog_AfterRequst(@"获取动态");
        [self.tableView reloadData];
    
    } failure:^(NSError *error) {
        
    }];
}

-(void)getWorks
{
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/Work/getworklistbyuid1?hascount=0&nottopic=0&uid=580298&workscount=36" success:^(id json) {
        
       self.works = [TSWork mj_objectArrayWithKeyValuesArray:json[@"result"]];
        TSLog_AfterRequst(@"获取作品");
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)getsubSets
{
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/user/topic?uid=580298" success:^(id json) {
        TSLog_AfterRequst(@"获取子集");
        
        for (int i = 0; i < 100; i ++) {
            [self.subsets addObject:[NSString stringWithFormat:@"subset-%d",i]];
        }
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - UI
- (void)setupTableHeaderView
{
    TSPersonTableHeaderView *headView = [TSPersonTableHeaderView tableHeaderView];
    headView.frame =  CGRectMake(0, 0, ScreenWidth, 280);
    [self.tableView addSubview:headView];
    headView.backgroundColor = [UIColor blackColor];
    self.tableView.tableHeaderView = headView;
}


- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    // 插入view 用于head的停留
    tableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
    UIView *insertView = [[UIView alloc] initWithFrame:CGRectMake(0, -44, ScreenWidth, 44)];
    [self.tableView addSubview:insertView];
    insertView.backgroundColor = [UIColor blackColor];
}

- (void)setupNav
{
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    [self.view addSubview:navView];
    navView.backgroundColor = [UIColor clearColor];
    self.navView = navView;
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 44, 44)];
    [backBtn setImage:IMAGE(@"profile_03") forState:(UIControlStateNormal)];
    backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [navView addSubview:backBtn];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 44, 0, 44, 44)];
    [navView addSubview:shareBtn];
    [shareBtn setImage:IMAGE(@"profile_04") forState:(UIControlStateNormal)];
    shareBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    shareBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
}

#pragma mark - action
- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)shareBtnClick
{
    SHOWALERT(@"分享");
}

#pragma mark tableView - dataSource & dalegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!self.currentIndex )  return 78; //动态
    else return 1; // 其他
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"id";
    UITableViewCell *cell ;
    if(self.currentIndex == 0) // 动态
    {
      cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"row-%ld",indexPath.row];
    }else if (self.currentIndex == 1) // 作品
    {
        TSPersonWorkCell *workCell = [[TSPersonWorkCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TSPersonWorkCell"];
        workCell.backgroundColor = [UIColor redColor];
        workCell.works = self.works;
        cell = workCell;
        
    }else if (self.currentIndex == 2) // 画题
    {
        TSPersonTopicCell *topicCell = [[TSPersonTopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TSPersonTopicCell"];
        topicCell.backgroundColor = [UIColor whiteColor];
        cell = topicCell;
        
    }else if (self.currentIndex == 3) // 集子
    {
        TSPersonSubSetCell *subSetCell = [[TSPersonSubSetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TSPersonSubSetCell"];
        subSetCell.backgroundColor = [UIColor cyanColor];
        cell = subSetCell;
        subSetCell.subSets = self.subsets;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currentIndex == 0) {
        
        // 1.有题目；340 图 230 * 230
        // 2.没题目 320
        // 3. 转发 ： h = 170;
        
        
//        if (self.dynamics.count) {
//            TSDynamic *dynamic = self.dynamics[indexPath.row];
//            if (dynamic.action) { // 有题目
//                
//                
//                if (dynamic.subfeed) { // 有转发
//                    return 285;
//                    
//                }
//                return 340;
//            }
//            
//            return 320;
//        }
        return 30;
    }
    
    else if (self.currentIndex == 1) { // 作品
       int count = (int)self.works.count ;
        CGFloat wh = (ScreenWidth - (4 * 10)) / 3 ;
        return 10 +  count / 3 * (wh + 10);
    }
    else if (self.currentIndex == 2) {
         return 400;
    }
    else if (self.currentIndex == 3) // 集子
    {
         int count = (int)self.subsets.count ;
        return 10 +  count / 3 * (160 + 10);
    }
    

    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)  return 60;
    return 0.01;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 0 ){
        return [self headView];
    }
    return nil;
}

- (UIView *)headView
{
    if(self.btnsView == nil)
    {
        TSMeHomeButtonsView *btnsView = [[TSMeHomeButtonsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
        btnsView.namesAndCountsDic = @{
                                       @"names": @[@"动态",@"作品",@"画题",@"集子"],
                                       @"counts" : @[@"4",@"34",@"12",@"5"],
                                       @"color" : [UIColor whiteColor],
                                       @"type" : @1
                                       };
        btnsView.backgroundColor = [UIColor blackColor]; // 一定要设置颜色 不然会穿过
        self.btnsView = btnsView;
        btnsView.btnClick = ^ (int index){
            self.currentIndex = index;
            [self.tableView reloadData];
        };
        return self.btnsView;
    }
    return self.btnsView;
}


#pragma mark scrollViewDidScroll
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollView.contentOffset.y :%f",scrollView.contentOffset.y);
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY >= 280 - 44) {
        self.navView.backgroundColor = [UIColor blackColor];
        NSLog(@"变黑");
    }else
    {
        NSLog(@"变透明");
        self.navView.backgroundColor = [UIColor clearColor];
    }
    
    // tablview 背景色
    if (offsetY > -44) {
        self.tableView.backgroundColor = [UIColor whiteColor];
    }else {
        self.tableView.backgroundColor = [UIColor blackColor];
    }
    
}

@end
