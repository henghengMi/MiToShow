//
//  TSMessageMeController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/19.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSMessageMeController.h"
#import "TSMessageMeCell.h"

#import "TSBasicCell.h"

@interface TSMessageMeController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) NSArray * images;
@property(nonatomic, strong) NSArray * titles;
@property(nonatomic, weak) UITableView * tableview;

@end

@implementation TSMessageMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupDatArray];
    [self  setupTableView];
    
}

- (void) setupDatArray
{
    self.images = @[
                    @"messagePraise_",
                    @"messageComments_",
                    @"forward_",
                    @"jietu2_",
                    @"Feedback_"
                    ];
    self.titles = @[
                    @"赞",
                    @"@与评论",
                    @"转发",
                    @"话题提醒",
                    @"通知"
                    ];
}


-(void)setupTableView
{
    if (self.tableview == nil) {
        UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth , TSTableViewHeight) style:UITableViewStyleGrouped];
        [self.view addSubview:tableview];
        tableview.dataSource = self;
        tableview.delegate = self;
        self.tableview = tableview;
        tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableview.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark tableView dataSource & dalegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"id";
    
    TSBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[TSBasicCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.titles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.images[indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHOWALERT(self.titles[indexPath.row]) ;
}


@end
