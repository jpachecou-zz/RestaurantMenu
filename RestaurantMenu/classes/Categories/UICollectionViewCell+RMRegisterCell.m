//
//  UICollectionViewCell+RMRegisterCell.m
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 2/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import "UICollectionViewCell+RMRegisterCell.h"

@implementation UICollectionViewCell (RMRegisterCell)

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

+ (void)registerCellInCollectionView:(UICollectionView *)collectionView {
    UINib *nib = [UINib nibWithNibName:[self cellIdentifier] bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:[self cellIdentifier]];
}

@end

@implementation UICollectionReusableView (RMRegisterCell)

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

+ (void)registerCellInCollectionView:(UICollectionView *)collectionView {
    UINib *nib = [UINib nibWithNibName:[self cellIdentifier] bundle:nil];
    [collectionView registerNib:nib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
            withReuseIdentifier:[self cellIdentifier]];
}

@end
