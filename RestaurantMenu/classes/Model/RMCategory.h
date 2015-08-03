//
//  RMCategory.h
//  
//
//  Created by Jonathan Pacheco on 1/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <RestKit/RestKit.h>
#import "RMModelBase.h"

@class NSManagedObject;

@interface RMCategory : NSManagedObject <RMModelBase>

@property (nonatomic, retain) NSString  *categoryDescription;
@property (nonatomic, retain) NSNumber  *categoryId;
@property (nonatomic, retain) NSString  *name;
@property (nonatomic, retain) NSNumber  *price;
@property (nonatomic, retain) NSSet     *subcategories;

@end

@interface RMCategory (CoreDataGeneratedAccessors)

- (void)addSubcategoriesObject:(NSManagedObject *)value;
- (void)removeSubcategoriesObject:(NSManagedObject *)value;
- (void)addSubcategories:(NSSet *)values;
- (void)removeSubcategories:(NSSet *)values;

@end