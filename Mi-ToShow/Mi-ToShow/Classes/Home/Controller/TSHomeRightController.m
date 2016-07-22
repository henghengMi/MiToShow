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
#import "TSSquareCollectionViewCell.h"
#import "TSSomeOneView.h"
#import "TSCollectionFootView.h"
@interface TSHomeRightController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    BOOL  _showingTop;
    BOOL _isLoadingMore;
    CGFloat _lastOffsetY;
    NSInteger _pageCount;
    
}
@property(nonatomic, strong) NSMutableArray * hotWorksArr;
@property(nonatomic, strong) NSMutableArray * newsWorksArr;
@property(nonatomic, strong) NSArray * DrawTopics;
@property(nonatomic, weak)   UICollectionView * collectionView;

@property(nonatomic, strong) TSSomeOneView *topView;

@end

static  NSString  * const cellReuserID = @"squareCellID";
static  NSString  * const headCellIdentifier = @"headCellIdentifier";
static  NSString  * const footCellIdentifier = @"footCellIdentifier";
@implementation TSHomeRightController

- (NSMutableArray *)hotWorksArr
{
    if (!_hotWorksArr) {
        _hotWorksArr = [NSMutableArray array];
    }
    return _hotWorksArr;
}

- (NSMutableArray *)newsWorksArr
{
    if (!_newsWorksArr) {
        _newsWorksArr = [NSMutableArray array];
    }
    return _newsWorksArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor brownColor];
   
    [self setupCollectionView];
    [self getSomePerson];
    [self getHotWorks];
    [self getNewWorks];
    
    // 监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rightTitleClick:) name:kTSNotificationName_rightleClick object:nil];
    // 监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabbarIndexClick:) name:kTSNotificationName_tabBarRightItemClick object:nil];
}

#pragma mark tabBarItem点击
- (void)tabbarIndexClick:(NSNotification *)nf
{
    NSLog(@"右nf.userInfo:%@",nf.userInfo);
    
    if(self.collectionView.contentOffset.y != 0 && _isLoadingMore == NO && self.collectionView.mj_header.state != MJRefreshStateRefreshing )
    {
        [self.collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}


-(void)rightTitleClick:(NSNotification *)nf
{
    if ([nf.userInfo[@"isonright"] boolValue])
    {
        [self.collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
    }

}

#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (_isLoadingMore) return;
    
    // 实际边界的Y
    CGFloat boundaryY =  scrollView.contentSize.height - scrollView.height ;
    CGFloat d = 180.0f;
    
    // 达到3个条件才能刷新 1. 到达触发值 2.在上拉 3.不是加载中
    // 用fmaxf来取与0比较后较大值的原因是，当scrollView内容为空时scrollView.contentSize.height可能是0
    if (offsetY >= fmaxf(.0f, boundaryY) - d && (_isLoadingMore) == NO && _lastOffsetY < offsetY ) //x是触发操作的阀值
    {
        //触发上拉刷新
        NSLog(@"触发加载更多数据");
        _isLoadingMore = YES;
        [self loadMoreNewTopicRequst];
    }
}
#pragma mark 加载更多
-(void)loadMoreNewTopicRequst
{
    NSLog(@"加载更多数据的请求");
    //    http://api.toshow.com/api/explore/topicgroup1?group=3&hascount=3&requestcount=20
    
    if (!_pageCount) _pageCount = 1 ;
    
    NSString *url = [NSString stringWithFormat:@"http://api.toshow.com/api/explore/worklist1?last=1586905&page=%ld&requestcount=24&type=0",_pageCount];
    
    [TSNetWorkTool getWithURL:url success:^(id json) {
        
        NSMutableArray *newTopics = [TSWork mj_objectArrayWithKeyValuesArray:json[@"result"]];
        // 插入
        [newTopics insertObjects:self.newsWorksArr atIndex:0];
        // 替换
        self.newsWorksArr = newTopics;
        // 刷新
        [self.collectionView reloadData];
        _pageCount ++;
        _isLoadingMore = NO;
        
        
    } failure:^(NSError *error) {
        
    }];
}


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");
    _lastOffsetY =  scrollView.contentOffset.y;
}




#pragma mark 获取最热数据
- (void)getHotWorks
{
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/explore/worklist1?page=0&requestcount=11&type=1" success:^(id json) {
        
        self.hotWorksArr = [TSWork mj_objectArrayWithKeyValuesArray:json[@"result"]];
        TSLog_AfterRequst(@"获取最热话题");
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark 获取最新话题
-(void)getNewWorks
{
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/explore/worklist1?last=0&page=0&requestcount=24&type=0" success:^(id json) {
        
        self.newsWorksArr = [TSWork mj_objectArrayWithKeyValuesArray:json[@"result"]];
        TSLog_AfterRequst(@"获取最新话题");
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark 获取三个推荐用户
-(void)getSomePerson
{
    [TSNetWorkTool getWithURL:@"http://api.toshow.com/api/explore/user?hascount=0&requestcount=20&simple=0" success:^(id json){
         NSLog(@"---discoverToPerson---");
        // 由于数据中works都是0 所以暂时不做操作
        
       self.DrawTopics = [DrawTopic mj_objectArrayWithKeyValuesArray:json[@"result"]] ;
        [self.collectionView reloadData];
        TSLog_AfterRequst(@"获取三个推荐用户");
        
//        [self ceateCollectionViewInsetView];
        
    } failure:^(NSError *error) {
        
    }];
}


-(void)setupCollectionView
{
    if (self.collectionView == nil) {
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
        //    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellReuserID];
        [collectionView registerNib:[UINib nibWithNibName:@"TSSquareCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellReuserID];
        [collectionView registerClass:[TSCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headCellIdentifier];
        [collectionView registerClass:[TSCollectionFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footCellIdentifier];
        
        collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView = collectionView;
//        self.collectionView.contentInset = UIEdgeInsetsMake(65, 0, 0, 0);
    }
    // 配置刷新
 [[TSTool sharedTSTool] headerWithRefreshingWithView:self.collectionView Target:self refreshingAction:@selector(reloadNewData)];
//    header.x = ScreenWidth;
//    [self setupRefreshHeader];
 
}

- (void)setupRefreshHeader
{
//    [[TSTool sharedTSTool] headerWithRefreshingWithView:self.tableview Target:self refreshingAction:@selector(loadNewData)];
    
//    [self.collectionView.mj_header endRefreshing];
    
//    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadNewData)];
//    [header setImages:[TSTool getPullImages] forState:MJRefreshStateIdle];
//    [header setImages:[TSTool getRefreshImages]  forState:MJRefreshStateRefreshing];
//    self.collectionView.mj_header = header;
//    header.lastUpdatedTimeLabel.hidden = YES;
//    header.stateLabel.hidden = YES;
//    header.width = ScreenWidth * 2;
}

#pragma mark 刷新
-(void)reloadNewData
{
   [self.collectionView.mj_header endRefreshing];
     NSLog(@"刷新");
    
    [self getSomePerson];
    [self getHotWorks];
    [self getNewWorks];
}

#pragma mark 插入的view（推荐人）
- (void)ceateCollectionViewInsetView
{
    if (self.topView == nil) {
        TSSomeOneView *topView = [[TSSomeOneView alloc] initWithFrame:CGRectMake(0,-65, ScreenWidth, 65)];
        topView.backgroundColor = [UIColor whiteColor];
        [self.collectionView addSubview:topView];
        topView.images = self.DrawTopics;
        topView.someOneClick =  ^(int index){
            DrawTopic *d = self.DrawTopics[index];
            SHOWALERT(d.user.nickname);
        };
        [topView someOneViewDiscoverBtnAddTager:self action:@selector(someOneViewDiscoverBtn) forControlEvents:(UIControlEventTouchUpInside)];
        self.topView = topView;
        
        UIView *dividerV = [[UIView alloc] initWithFrame:CGRectMake(0, 55,ScreenWidth, 10)];
        [self.topView addSubview:dividerV];
        dividerV.backgroundColor = TSColor(241, 241, 241);
    }
}


#pragma mark collectionView dataSource && delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  
    if (indexPath.section == 0) {
          DrawTopic *d = self.hotWorksArr[indexPath.row];
        SHOWALERT(d.user.nickname);
    }else if (indexPath.section == 1) {
          DrawTopic *d = self.newsWorksArr[indexPath.row];
         SHOWALERT(d.user.nickname);
    }
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section == 0) return self.hotWorksArr.count;
    return self.newsWorksArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TSSquareCollectionViewCell *cell;
    if (indexPath.section == 0) {
        cell  = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuserID forIndexPath:indexPath];
        cell.imgName = @"Mi_01";
        cell.drawTopic = self.hotWorksArr[indexPath.row];
    } else if (indexPath.section == 1)
    {
        cell  = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuserID forIndexPath:indexPath];
        cell.imgName = @"Mi_02";
        cell.drawTopic = self.newsWorksArr[indexPath.row];
    }
    return cell;

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat h  =  (section == 0) ? 100 : 35;
    return CGSizeMake(ScreenWidth, h);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGFloat h  =  (section == 0) ?  (40 + 10) : 3 ;
    return CGSizeMake(ScreenWidth, h);
}

// 获取Header的 方法。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reuseView ;
    
    if (kind == UICollectionElementKindSectionHeader) {
        //从缓存中获取 Headercell
        TSCollectionHeaderView *headView = (TSCollectionHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headCellIdentifier forIndexPath:indexPath];
        headView.backgroundColor = [UIColor whiteColor];
        if (headView == nil)   headView = [[TSCollectionHeaderView alloc] init];
        headView.titleName = (indexPath.section == 0) ? @"最热画题" : @"最新话题";
        headView.imgName = (indexPath.section == 0) ? @"commend_03" : @"commend_04" ;
//        if (indexPath.section == 1) headView.backgroundColor = [UIColor whiteColor];
        reuseView = headView;
        // 传递图片
        headView.images = self.DrawTopics;
        headView.indexPath = indexPath;
        
        headView.someoneView.someOneClick =  ^(int index){
            DrawTopic *d = self.DrawTopics[index];
            SHOWALERT(d.user.nickname);
        };
        [headView.someoneView someOneViewDiscoverBtnAddTager:self action:@selector(someOneViewDiscoverBtn) forControlEvents:(UIControlEventTouchUpInside)];
        
    }

    if (kind == UICollectionElementKindSectionFooter){
        TSCollectionFootView *footView = (TSCollectionFootView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footCellIdentifier forIndexPath:indexPath];
        if (footView == nil) {
            footView = [[TSCollectionFootView alloc] init];
        }
        footView.backgroundColor =  TSColor(241, 241, 241);
        reuseView = footView;
        
        if (indexPath.section == 1) {
            footView.backgroundColor = [UIColor whiteColor];
        }
        footView.indexPath = indexPath ;
        
        [footView.btn addTarget: self action:@selector(checkMoreHotTopic:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return reuseView;
}


#pragma 查看更多更热话题
- (void)checkMoreHotTopic:(UIButton *)btn
{
    SHOWALERT(btn.currentTitle);
}

#pragma mark 发现途友
- (void)someOneViewDiscoverBtn
{
    SHOWALERT(@"发现途友");
}


@end
