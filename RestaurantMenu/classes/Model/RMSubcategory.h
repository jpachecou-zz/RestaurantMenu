//
//  RMSubcategory.h
//  
//
//  Created by Jonathan Pacheco on 1/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "RMModelBase.h"

@class RMCategory, RMItem;

@interface RMSubcategory : NSManagedObject<RMModelBase>

@property (nonatomic, retain) NSString      *name;
@property (nonatomic, retain) NSString      *subcategoryDescription;
@property (nonatomic, retain) NSNumber      *subcategoryId;
@property (nonatomic, retain) NSSet         *items;
@property (nonatomic, retain) RMCategory    *category;
@property (nonatomic, retain) NSData        *imageData;
@property (nonatomic, retain) NSString      *imageURL;

@end

@interface RMSubcategory (CoreDataGeneratedAccessors)

- (void)addItemsObject:(RMItem *)value;
- (void)removeItemsObject:(RMItem *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
