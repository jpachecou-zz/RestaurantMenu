//
//  RMModelBase.h
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 2/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@protocol RMModelBase <NSObject>

@required
+ (RKObjectMapping *)objectMapping;
+ (RKResponseDescriptor *)responseDescriptor;

@end
