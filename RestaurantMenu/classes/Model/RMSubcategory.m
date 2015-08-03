//
//  RMSubcategory.m
//  
//
//  Created by Jonathan Pacheco on 1/08/15.
//
//

#import "RMSubcategory.h"
#import "RMCategory.h"
#import "RMItem.h"


@implementation RMSubcategory

@dynamic name;
@dynamic subcategoryDescription;
@dynamic subcategoryId;
@dynamic items;
@dynamic category;
@dynamic imageData;
@dynamic imageURL;

+ (RKObjectMapping *)objectMapping {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Subcategory" inManagedObjectStore:[RKObjectManager sharedManager].managedObjectStore];
    [mapping addAttributeMappingsFromDictionary:
     @{
       @"name":         @"name",
       @"id":           @"subcategoryId",
       @"description":  @"subcategoryDescription",
       @"image":        @"imageURL",
       }];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"items"
                                                                            toKeyPath:@"items"
                                                                          withMapping:[RMItem objectMapping]]];
    return mapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self objectMapping] method:RKRequestMethodAny pathPattern:@"subcategory/:categoryId" keyPath:nil statusCodes:statusCodes];
    return responseDescriptor;
}

@end