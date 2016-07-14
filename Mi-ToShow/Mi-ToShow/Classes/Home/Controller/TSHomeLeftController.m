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

@interface TSHomeLeftController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property(nonatomic, weak)  UITableView *tableview ;

@end

@implementation TSHomeLeftController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setupTableView];
    
    [self requstBanner];
}

-(void)requstBanner
{
    [TSNetWorkTool TSGetWithURL:@"http://api.toshow.com/api/explore/banner" success:^(id json) {
        
//        NSArray *imagesDicArray = json[@"result"];
//        NSMutableArray *mImages = [NSMutableArray array];
//        for (int i = 0 ;i < imagesDicArray.count; i ++) {
//            NSDictionary *dic = imagesDicArray[i];
//            [mImages addObject:[NSString stringWithFormat:@"%@%@",TSImageHost,dic[@"banner_url"]]];
//            
//        }
       
        
    } failure:^(NSError *error) {
        
    }];
}


-(void)setupTableView
{
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth , TSTableViewHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:tableview];
    tableview.dataSource = self;
    tableview.delegate = self;
    self.tableview = tableview;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.backgroundColor = [UIColor whiteColor];
    
    [self setupHeaderView];
}

#pragma mark 轮播图
-(void)setupHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180 + 8)];
    
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"http://i4.3conline.com/images/piclib/201101/25/batch/1/82603/129596384425865pgpyq8r8_medium.jpg",
                                  @"http://it.people.com.cn/mediafile/200808/06/F200808061429286120556353.jpg",
                                  @"http://i4.3conline.com/images/piclib/201101/25/batch/1/82603/129596384425865pgpyq8r8_medium.jpg"
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
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        
         cell = [tableView dequeueReusableCellWithIdentifier:@"DrawHot"];
        if(!cell)
        {
            // 第一种方法
//            UINib *nib =  [UINib nibWithNibName:@"TSDrawHotTableViewCell" bundle:nil];//nil则默认为mainBundle
//                 NSArray *array = [nib instantiateWithOwner:nil options:nil];
//                   cell = array[0];
          cell = (TSDrawHotTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"TSDrawHotTableViewCell" owner:nil options:nil] firstObject];
            
         
            
        }

    }
    else if (indexPath.section == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"DrawNew"];
        if (!cell) {
            cell = (TSDrawNewCell *)[[[NSBundle mainBundle] loadNibNamed:@"TSDrawNewCell" owner:nil options:nil] firstObject];
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
