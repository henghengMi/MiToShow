//
//  TSHomeRightController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/11.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSHomeRightController.h"
#import "TSCollectionHeaderView.h"
#import "TSUser.h"
#import "DrawTopic.h"
#import "TSWork.h"
@interface TSHomeRightController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

static  NSString  * const cellReuserID = @"UICollectionViewCellID";
static  NSString  * const headCellIdentifier = @"headCellIdentifier";

@implementation TSHomeRightController


- (void)viewDidLoad {
    [super viewDidLoad];

  self.view.backgroundColor = [UIColor brownColor];

    
    [self setupCollectionView];
    
//    [self getSomePerson];
      [self getHotWorks];
//    [self getNewWorks];

}

#pragma mark 获取最热数据
- (void)getHotWorks
{
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/explore/worklist1?page=0&requestcount=12&type=1" success:^(id json) {
        
        NSArray *works = [TSWork mj_objectArrayWithKeyValuesArray:json[@"result"]];
        TSLog_AfterRequst(@"获取最热话题");
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark 获取最新话题
-(void)getNewWorks
{
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/explore/worklist1?last=0&page=0&requestcount=24&type=0" success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark 获取三个推荐用户
-(void)getSomePerson
{
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/explore/user?hascount=0&requestcount=20&simple=0" success:^(id json){
         NSLog(@"---discoverToPerson---");
        // 由于数据中works都是0 所以暂时不做操作
        
        NSArray *array = [DrawTopic mj_objectArrayWithKeyValuesArray:json[@"result"]] ;
        
        
    
        
    } failure:^(NSError *error) {
        
    }];
}


-(void)setupCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat margin = 10;
    CGFloat WH = (ScreenWidth - 4 * margin) / 3;
    layout.itemSize = CGSizeMake(WH, WH);
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
    layout.sectionInset = UIEdgeInsetsMake(layout.minimumLineSpacing,layout.minimumInteritemSpacing, layout.minimumLineSpacing , layout.minimumInteritemSpacing);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TSTableViewHeight) collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellReuserID];
    [collectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headCellIdentifier];
    collectionView.backgroundColor = [UIColor greenColor];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuserID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor blackColor];
    
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat h  = (section == 0)  ? 35 + 55 + 10: 35;
    return CGSizeMake(ScreenWidth, h);
}

// 获取Header的 方法。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    //从缓存中获取 Headercell
    TSCollectionHeaderView *headView = (TSCollectionHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headCellIdentifier forIndexPath:indexPath];
    headView.backgroundColor = [UIColor yellowColor];
    
    if(indexPath.section == 0)
    {
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 55)];
        topView.backgroundColor = [UIColor redColor];
        [headView addSubview:topView];
    }
    
    return headView;
}



@end
