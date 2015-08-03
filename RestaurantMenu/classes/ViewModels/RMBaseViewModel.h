//
//  RMBaseViewModel.h
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 1/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RMBaseViewModel <NSObject>

@required

+ (instancetype)viewModel;
- (NSString *)viewModelObjectName;

@end
