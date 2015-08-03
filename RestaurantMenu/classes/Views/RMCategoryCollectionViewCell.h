//
//  RMCategoryCollectionViewCell.h
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 2/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMSubcategory.h"

@interface RMCategoryCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) RMSubcategory *subcategory;

@end
