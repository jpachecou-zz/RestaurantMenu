//
//  RMCategoryViewModel.h
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 1/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "RMBaseViewModel.h"
#import "RMCategoryViewModel.h"

@interface RMCategoryViewModel : NSObject <RMBaseViewModel>

@property (copy, nonatomic) NSArray *categories;

@end
