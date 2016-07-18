//
//  TSHomeLeftController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/11.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSHomeLeftController.h"
#import "SDCycleScrollView.h"
#import "TSDrawHotTableViewCell.h"
#import "TSDrawNewCell.h"
#import "TSBanner.h"
#import "DrawTopic.h"
#import "TSAllDrawTopic.h"

#import "MJRefresh.h"

@interface TSHomeLeftController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
{
    NSInteger _hascount;
    NSInteger _requestcount;
}
@property(nonatomic, weak)  UITableView *tableview ;
@property(nonatomic, strong)  NSMutableArray *banners ;
@property(nonatomic, strong)  NSMutableArray *dataArray ;

@end

@implementation TSHomeLeftController


- (NSMutableArray *)banners
{
    if (!_banners) {
        _banners = [NSMutableArray array];
    }
    return _banners;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self requstBanner];
}

#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
     NSLog(@"offsetY: %f",offsetY);
    
    
    
    
}


#pragma mark 首页数据
-(void)requstDraw
{
    if (self.dataArray.count) [self.dataArray removeAllObjects];
    
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/explore/topicgroup1?group=0&hascount=0&requestcount=0" success:^(id json) {
        self.dataArray = [TSAllDrawTopic mj_objectArrayWithKeyValuesArray:json[@"result"]];
     
        [self setupTableView];
        [self.tableview reloadData];
        [self setupRefreshHeader];
        
    } failure:^(NSError *error) {
    
    }];
}

- (void)setupRefreshHeader
{
    [[TSTool sharedTSTool] headerWithRefreshingWithView:self.tableview Target:self refreshingAction:@selector(loadNewData)];
}



#pragma mark 刷新
- (void)loadNewData
{
     NSLog(@"刷新------");

    
    [self requstBanner];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.tableview.mj_header endRefreshing];
//    });
}


-(void)requstBanner
{
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/explore/banner" success:^(id json) {
        
        self.banners = [TSBanner mj_objectArrayWithKeyValuesArray: json[@"result"]] ;
        
        [self requstDraw];
        
    } failure:^(NSError *error) {
        
    }];
}


-(void)setupTableView
{
    // 幻灯片
    NSMutableArray *imagesURLStrings = [NSMutableArray array];
    for (int i = 0; i < self.banners.count; i ++) {
        TSBanner *banner = self.banners[i];
        [imagesURLStrings addObject:banner.banner_url];
    }
    
    if (self.tableview == nil) {
        UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth , TSTableViewHeight) style:UITableViewStyleGrouped];
        [self.view addSubview:tableview];
        tableview.dataSource = self;
        tableview.delegate = self;
        self.tableview = tableview;
        tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableview.backgroundColor = [UIColor whiteColor];
        
        [self setupHeaderViewWithImageUrlArray:imagesURLStrings];
    }else // 已经创建过，所以这里要更新
    {
        
    }

}

#pragma mark 轮播图
-(void)setupHeaderViewWithImageUrlArray:(NSArray *)imageUrlArray
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180 + 8)];
    
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"http://f.hiphotos.baidu.com/zhidao/pic/item/0b46f21fbe096b634bdfe39b0d338744eaf8ac33.jpg",
                                  @"http://it.people.com.cn/mediafile/200808/06/F200808061429286120556353.jpg",
                                  @"http://pic24.nipic.com/20121012/5955207_230020121000_2.jpg"
                                  ];  
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 8, ScreenWidth, 180) delegate:self placeholderImage:[UIImage imageWithColor:[UIColor blackColor]]];
  
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    cycleScrollView.showPageControl = NO; // 不展示分页控制器
    cycleScrollView.autoScrollTimeInterval = 3.5;
//    cycleScrollView.autoScroll = NO; // 不自动滚动
    
    [headerView addSubview:cycleScrollView];
     self.tableview.tableHeaderView = headerView;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    

}

#pragma mark tableView dataSource & dalegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
   TSAllDrawTopic *allTopic =  self.dataArray[section];

    return allTopic.topiclist.count;
    
//    if (section == 0) {
//        return ;
//    }
//    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
     TSAllDrawTopic *allTopic =  self.dataArray[indexPath.section];
    
    if (indexPath.section == 0) {
        
         cell = [tableView dequeueReusableCellWithIdentifier:@"DrawHot"];
        if(!cell)
        {
          cell = (TSDrawHotTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"TSDrawHotTableViewCell" owner:nil options:nil] firstObject];
            TSDrawHotTableViewCell *hotCell = (TSDrawHotTableViewCell *) cell;
            hotCell.drawTopic =  allTopic.topiclist[indexPath.row];
        }

    }
    else if (indexPath.section == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"DrawNew"];
        if (!cell) {
            cell = (TSDrawNewCell *)[[[NSBundle mainBundle] loadNibNamed:@"TSDrawNewCell" owner:nil options:nil] firstObject];
            TSDrawNewCell *newCell = (TSDrawNewCell *) cell;
            newCell.drawTopic =  allTopic.topiclist[indexPath.row];
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 190;
    }
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 35+10;
    }
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *hv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
//    hv.backgroundColor = [UIColor yellowColor];
    
    UIButton * headerBtn = [UIButton buttonWithType:0];
    headerBtn.frame = CGRectMake(TSLefrMargin, 0, ScreenWidth - 2 * TSLefrMargin, 40);
    [hv addSubview:headerBtn];
    [headerBtn setImage:(section == 0) ? IMAGE(@"commend_03") : IMAGE(@"commend_04") forState:(UIControlStateNormal)];
    [headerBtn setTitle:(section == 0) ? @"最热画题" : @"最新话题" forState:UIControlStateNormal];
    headerBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    [headerBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    headerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    headerBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    return hv;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(section == 0)
    {
        UIView *fv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        fv.backgroundColor = [UIColor whiteColor];
        
        UIButton *footBtn = [UIButton buttonWithType:0];
        footBtn.frame = CGRectMake(0, 0, ScreenWidth, 35);
        [fv addSubview:footBtn];
        [footBtn setTitle:@"查看更多热门话题" forState:(UIControlStateNormal)];
        [footBtn setImage:IMAGE(@"right_gray_arrow") forState:(UIControlStateNormal)];
        [footBtn setTitleColor:TSColor(167, 167, 167) forState:(UIControlStateNormal)];
        footBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        footBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 60);
        footBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 150, 0, 0);
        
        UIView *footV = [[UIView alloc] initWithFrame:CGRectMake(0, 35, ScreenWidth, 10)];
        footV.backgroundColor = TSColor(243, 243, 243);
        [fv addSubview:footV];
        
        return fv;
    }
    return nil;
}



@end
