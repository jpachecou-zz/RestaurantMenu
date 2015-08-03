//
//  RMCategoryViewModel.m
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 1/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import "RMCategoryViewModel.h"
#import "RMCategory.h"
#import "RMCoreDataHelper.h"

@implementation RMCategoryViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}

- (void)loadData {
    static dispatch_once_t onceToken;
    RKObjectManager *manager = [RKObjectManager sharedManager];
    dispatch_once(&onceToken, ^{
        [manager addResponseDescriptor:[RMCategory responseDescriptor]];
    });
    [manager getObjectsAtPath:@"categories/" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        self.categories = [RMCoreDataHelper fetchCategoriesFromContext];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        self.categories = [RMCoreDataHelper fetchCategoriesFromContext];
        RKLogError(@"Load failed with error: %@", error);
    }];
}

- (NSString *)viewModelObjectName {
    return @"categories";
}

+ (instancetype)viewModel {
    return [[RMCategoryViewModel alloc] init];
}

@end
