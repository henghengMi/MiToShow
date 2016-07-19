//
//  TSMessageLetterController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/19.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSMessageLetterController.h"
#import "TSLetterCell.h"
@interface TSMessageLetterController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, weak) UITableView * tableview;

@end

@implementation TSMessageLetterController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self  setupTableView];
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"letterCell";
    
    TSLetterCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = (TSLetterCell *)[[[NSBundle mainBundle] loadNibNamed:@"TSLetterCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
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
