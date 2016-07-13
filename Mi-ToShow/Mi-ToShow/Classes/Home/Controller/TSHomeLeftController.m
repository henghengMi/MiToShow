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

@interface TSHomeLeftController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property(nonatomic, weak)  UITableView *tableview ;

@end

@implementation TSHomeLeftController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor grayColor];
    
  
    [self setupTableView];
}


-(void)setupTableView
{
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth , TSTableViewHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:tableview];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.backgroundColor = [UIColor whiteColor];
    self.tableview = tableview;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setupHeaderView];
}

#pragma mark 轮播图
-(void)setupHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 150 + 8)];
    
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"http://i4.3conline.com/images/piclib/201101/25/batch/1/82603/129596384425865pgpyq8r8_medium.jpg",
                                  @"http://it.people.com.cn/mediafile/200808/06/F200808061429286120556353.jpg",
                                  @"http://i4.3conline.com/images/piclib/201101/25/batch/1/82603/129596384425865pgpyq8r8_medium.jpg"
                                  ];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 8, ScreenWidth, 150) delegate:self placeholderImage:[UIImage imageWithColor:[UIColor blackColor]]];
    
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    cycleScrollView.showPageControl = NO; // 不暂时分页控制器
    cycleScrollView.autoScroll = NO; // 不自动滚动
    
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"id";
    
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        
         cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        [tableView registerNib:[UINib nibWithNibName:@"TSDrawHotTableViewCell" bundle:nil] forCellReuseIdentifier:@"DrawHot"];
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"DrawHot"];
    }
    else if (indexPath.section == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"row-%ld",indexPath.row];
    }
    
    

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 165;
    }
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 35;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *hv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    hv.backgroundColor = [UIColor yellowColor];
    
    return hv;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *fv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 35)];
    fv.backgroundColor = [UIColor redColor];
    return fv;
    
}



@end
