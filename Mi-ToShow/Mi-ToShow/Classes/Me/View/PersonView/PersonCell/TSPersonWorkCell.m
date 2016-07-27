//
//  TSPersonWorkCell.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/21.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSPersonWorkCell.h"
#import "TSSquareCollectionViewCell.h"
@interface TSPersonWorkCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic, weak)  UICollectionView *collectionView ;

@end

@implementation TSPersonWorkCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        
//        self.backgroundColor = [UIColor grayColor];
        
        CGFloat margin = 10;
        CGFloat wh = (ScreenWidth - (4 * margin)) / 3 ;
        UICollectionViewFlowLayout  *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(wh, wh);
        layout.minimumLineSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);

        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self addSubview:collectionView];
         [collectionView registerNib:[UINib nibWithNibName:@"TSSquareCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"squareCellID"];
//        [collectionView registerClass:[TSSquareCollectionViewCell class] forCellWithReuseIdentifier:@"squareCellID"];
        self.collectionView = collectionView;
        collectionView.scrollEnabled = NO;
        collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return  self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];

    // 根据collectionView的contentSize设置collectionView的height
    // 10 +  _count / 3 * (wh + 10)
    //    CGFloat wh = (ScreenWidth - (4 * 10)) / 3 ;
    
    self.collectionView.frame = CGRectMake(0, 0,ScreenWidth,self.height);
    NSLog(@"%f",self.collectionView.contentSize.height);
    
}

- (void)setWorks:(NSArray *)works
{
    _works = works;
    [self.collectionView  reloadData];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TSSquareCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"squareCellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    cell.work = _works[indexPath.row];
    cell.imgName = @"Mi_01";
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.works.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TSWork *work = self.works[indexPath.row];
    SHOWALERT(work.workdescription)
}
@end
