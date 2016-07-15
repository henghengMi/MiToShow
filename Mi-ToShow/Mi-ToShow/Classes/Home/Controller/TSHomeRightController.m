//
//  TSHomeRightController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/11.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSHomeRightController.h"


@interface TSHomeRightController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

static    NSString  * const cellReuserID = @"UICollectionViewCellID";

@implementation TSHomeRightController


- (void)viewDidLoad {
    [super viewDidLoad];

  self.view.backgroundColor = [UIColor brownColor];

    
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


- ()


@end
