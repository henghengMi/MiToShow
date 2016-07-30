//
//  TSCareController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSCareController.h"

#import "TSCareCell.h"

@interface TSCareController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, weak) UITableView * tableView;
@property(nonatomic, strong) NSMutableArray * comments;
@end

@implementation TSCareController

- (NSMutableArray *)comments
{
    if (!_comments) {
        
        NSArray *array =   @[
                             @"怎么写君：666",
                             @"网络科技 : 677645",
                             @"cv：我爱你打两局",
                             @"暗算：我怎么知道你在干嘛呢。-"
                             ];

        _comments = [NSMutableArray arrayWithArray:array];
    }
    return _comments;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupTableView];
    [self nav];
    [self getWorks];
    
}

- (void)getWorks
{
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/feed/getfeed?requestcount=20&timestamp=0" success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}



- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TSNavigationHeight,ScreenWidth, TSTableViewHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor =[UIColor whiteColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

-(void)nav
{
    self.TSNavLeftImageName = @"addFeed";
    self.TSNavRightImageName = @"square_03";
    self.TSNavTitle = @"关注";
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
    static NSString *ID = @"TSCareCell";
    
    TSCareCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell =   [TSCareCell careCell]; //[[TSCareCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.comments = self.comments;
//    cell.textLabel.text = [NSString stringWithFormat:@"row-%ld",indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = self.comments.count;
    
    CGFloat  h = 2*8;
    for (int i = 0; i < count; i ++) {
        NSString *str = self.comments[i];
        h += [str sizeWithFont:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(ScreenWidth - 60 - 10 - 16, MAXFLOAT)].height;
        h += 5 ;
    }
    
     NSLog(@"h:%f",h);
    
//    CGFloat commentH = count * 15 + (count - 1) * 5 + 2*8;
    

    
    return 433 + h ;
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
