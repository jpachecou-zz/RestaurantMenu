//
//  RMUtil.h
//  restaurant-menu
//
//  Created by Jonathan Pacheco on 30/07/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMUtil : NSObject

+ (BOOL)isIPad;
+ (NSString *)currencyFormat:(NSNumber *)number;

@end
