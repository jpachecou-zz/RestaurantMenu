//
//  RMCategory.m
//  
//
//  Created by Jonathan Pacheco on 1/08/15.
//
//

#import "RMCategory.h"
#import "RMSubcategory.h"


@implementation RMCategory

@dynamic categoryDescription;
@dynamic categoryId;
@dynamic name;
@dynamic subcategories;
@dynamic price;


+ (RKObjectMapping *)objectMapping {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Category"
                                                   inManagedObjectStore:[RKObjectManager sharedManager].managedObjectStore];
    [mapping addAttributeMappingsFromDictionary:
     @{
       @"name":         @"name",
       @"id":           @"categoryId",
       @"description":  @"categoryDescription"
       }];
    
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"subcategories"
                                                                            toKeyPath:@"subcategories"
                                                                          withMapping:[RMSubcategory objectMapping]]];
    return mapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self objectMapping] method:RKRequestMethodAny pathPattern:@"categories/" keyPath:nil statusCodes:statusCodes];
    return responseDescriptor;
}


@end