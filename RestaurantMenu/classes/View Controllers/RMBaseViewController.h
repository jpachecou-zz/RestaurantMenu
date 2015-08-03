//
//  RMBaseViewController.h
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 2/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RMBaseViewController <NSObject>

@required
- (void)bindViewModel;

@optional
- (void)initializeComponents;

@end
