//
//  RMItem.m
//  
//
//  Created by Jonathan Pacheco on 1/08/15.
//
//

#import "RMItem.h"

@implementation RMItem

@dynamic name;
@dynamic itemDescription;
@dynamic itemId;
@dynamic subcategory;
@dynamic imageData;
@dynamic imageURL;
@dynamic price;

+ (RKObjectMapping *)objectMapping {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Item" inManagedObjectStore:[RKObjectManager sharedManager].managedObjectStore];
    [mapping addAttributeMappingsFromDictionary:
     @{
       @"name":         @"name",
       @"id":           @"ItemId",
       @"description":  @"itemDescription",
       @"price":        @"price",
       @"image":        @"imageURL"
       }];
    
    return mapping;
}

+ (RKResponseDescriptor *)responseDescriptor {
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self objectMapping] method:RKRequestMethodAny pathPattern:@"item/:itemId" keyPath:nil statusCodes:statusCodes];
    return responseDescriptor;
}


@end
