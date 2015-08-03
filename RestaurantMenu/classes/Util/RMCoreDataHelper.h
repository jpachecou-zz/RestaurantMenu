//
//  RMCoreDataHelper.h
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 30/07/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface RMCoreDataHelper : NSObject

+ (instancetype)sharedInstance;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

+ (NSArray *)fetchCategoriesFromContext;

@end
