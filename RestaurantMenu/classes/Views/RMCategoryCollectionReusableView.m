//
//  RMCategoryCollectionReusableView.m
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 2/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import "RMCategoryCollectionReusableView.h"

@interface RMCategoryCollectionReusableView ()

@property (nonatomic, weak) IBOutlet UILabel *categoryNameLabel;

@end

@implementation RMCategoryCollectionReusableView

- (void)setCategory:(RMCategory *)category {
    _category = category;
    self.categoryNameLabel.text = category.name;
}

@end
