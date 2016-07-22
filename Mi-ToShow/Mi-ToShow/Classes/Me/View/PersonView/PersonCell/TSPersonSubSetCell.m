//
//  TSPersonSubSetCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/21.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSPersonSubSetCell.h"
#import "TSSubSet.h"
#import "TSPersonSubSetCollectionViewCell.h"

@interface TSPersonSubSetCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation TSPersonSubSetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor grayColor];
        
        CGFloat margin = 10;
        CGFloat w = (ScreenWidth - (4 * margin)) / 3 ;
        UICollectionViewFlowLayout  *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(w, 160);
        layout.minimumLineSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self addSubview:collectionView];
        [collectionView registerNib:[UINib nibWithNibName:@"TSPersonSubSetCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"subsetCellID"];
    
        self.collectionView = collectionView;
        collectionView.scrollEnabled = NO;
        collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView = collectionView;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame  = self.bounds;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TSPersonSubSetCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"subsetCellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    cell.subset = self.subSets[indexPath.row];
    
//    cell.work = _works[indexPath.row];
//    cell.imgName = @"Mi_01";
    
    return cell;
}
- (void)setSubSets:(NSArray *)subSets
{
    _subSets = subSets;
    [self.collectionView reloadData];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.subSets.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    TSWork *work = self.works[indexPath.row];
//    SHOWALERT(work.workdescription)
}

@end
