//
//  RMUtil.m
//  restaurant-menu
//
//  Created by Jonathan Pacheco on 30/07/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMUtil.h"

@implementation RMUtil

+ (BOOL)isIPad {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+ (NSString *)currencyFormat:(NSNumber *)number {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.locale = [NSLocale currentLocale];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    return [formatter stringFromNumber:number];
}

@end
