//
//  RMItemsCollectionViewController.h
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 2/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMItem.h"
#import "RMBaseViewController.h"

@interface RMItemsCollectionViewController : UICollectionViewController <RMBaseViewController>

@property (nonatomic, strong) NSArray *items;

@end
