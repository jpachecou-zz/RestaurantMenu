//
//  UICollectionViewCell+RMRegisterCell.h
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 2/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (RMRegisterCell)

+ (void)registerCellInCollectionView:(UICollectionView *)collectionView;
+ (NSString *)cellIdentifier;

@end

@interface UICollectionReusableView (RMRegisterCell)

+ (NSString *)cellIdentifier;
+ (void)registerCellInCollectionView:(UICollectionView *)collectionView;


@end