//
//  TSHomeRightController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/11.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSHomeRightController.h"

@interface TSHomeRightController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TSHomeRightController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.view.backgroundColor = [UIColor brownColor];

    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth , TSTableViewHeight) style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.backgroundColor = [UIColor purpleColor];

}

#pragma mark tableView dataSource & dalegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"id";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row-%ld",indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}


@end
