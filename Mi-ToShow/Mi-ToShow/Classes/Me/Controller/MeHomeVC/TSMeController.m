//
//  MeController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSMeController.h"
#import "TSBasicCell.h"
#import "TSMeHomeCell.h"
#import "TSMeHomeHeaderView.h"
#import "TSPersonController.h"

@interface TSMeController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, weak)   UITableView * tableView;
@property(nonatomic, strong) NSArray * images;
@property(nonatomic, strong) NSArray * titles;
@property(nonatomic, strong) NSDictionary * imageDic;
@property(nonatomic, strong) NSDictionary * titleDic;

@end

@implementation TSMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.TSNavTitle = @"个人中心";
    self.TSNavRightImageName = @"search_person";
    
    [self setupTableView];
    [self setupData];
}

-(void)setupData
{
    
    _imageDic = @{
                  @"0Images" : @[@"follow_sign",@"fans_sign",@"Draft box_",@"userCollection_"],
                  @"1Images" : @[@"SystemNotification",@"Set up_"],
                  @"0Titles" : @[@"我的关注",@"我的粉丝",@"我的草稿",@"我的收藏"],
                  @"1Titles" : @[@"意见反馈",@"设置"]
                  };
}


-(void)setupTableView
{
    if (self.tableView == nil) {
        UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0,TSNavigationHeight + 4, ScreenWidth , TSTableViewHeight) style:UITableViewStyleGrouped];
        [self.view addSubview:tableview];
        tableview.dataSource = self;
        tableview.delegate = self;
        self.tableView = tableview;
        tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableview.backgroundColor = [UIColor whiteColor];
//        tableview.backgroundColor = [UIColor greenColor];
        
        [self setupTableViewHeader];
    }
}

- (void)TSNavRightImageDidClick
{
    SHOWALERT(@"TSNavRightImageDidClick");
}


-(void)setupTableViewHeader
{
    TSMeHomeHeaderView *headV = [TSMeHomeHeaderView headView];
    headV.frame = CGRectMake(0, 0, ScreenWidth, 145);
    self.tableView.tableHeaderView = headV;
    
    //    NSArray *names = @[ @"动态",@"作品",@"画题",@"集子"];
    //    NSArray *counts = @[@"3",@"34",@"0",@"0"];

    headV.buttonsView.namesAndCountsDic = @{
                                            @"names" : @[ @"动态",@"作品",@"画题",@"集子"],
                                            @"counts" : @[@"3",@"34",@"0",@"0"],
                                            @"color" : [UIColor blackColor]
                                            };
    
    headV.btnClick = ^(int index)
    {
        NSString *ix = [NSString stringWithFormat:@"点击了%d",index];
        SHOWALERT(ix);
    };
    headV.userInteractionEnabled = YES;
    [headV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headVtap:)]];
}

- (void)headVtap:(UIGestureRecognizer *)tap
{
//    SHOWALERT(@"点击顶部");
    TSPersonController *p = [[TSPersonController alloc] init];
    [self.navigationController pushViewController:p animated:YES];
}


#pragma mark tableView dataSource & dalegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.imageDic.count / 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }else if (section == 1)
    {
        return 2;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"TSBasicCell";
    
    TSMeHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[TSMeHomeCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        NSArray *images0 = _imageDic[@"0Images"];
        NSArray *titles0 = _imageDic[@"0Titles"];
        cell.textLabel.text = titles0[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:images0[indexPath.row]];
        cell.bottomLine.hidden = (indexPath.row == titles0.count -1);
    }
    else
    {
        NSArray *images1 = _imageDic[@"1Images"];
        NSArray *titles1 = _imageDic[@"1Titles"];
        cell.textLabel.text = titles1[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:images1[indexPath.row]];
        cell.numberLabel.hidden = YES;
//        cell.bottomLine.hidden = (indexPath.row == titles1.count -1);
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *hv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    hv.backgroundColor = [UIColor TSSectionColor];
    return hv;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = [NSString stringWithFormat:@"section %ld - row %ld",indexPath.section,indexPath.row];
    SHOWALERT(str);
}


@end
