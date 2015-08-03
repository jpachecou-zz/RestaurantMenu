//
//  RMItem.h
//  
//
//  Created by Jonathan Pacheco on 1/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "RMModelBase.h"
#import "RMSubcategory.h"

@class NSManagedObject;

@interface RMItem : NSManagedObject<RMModelBase>

@property (nonatomic, retain) NSString          *name;
@property (nonatomic, retain) NSString          *itemDescription;
@property (nonatomic, retain) NSNumber          *itemId;
@property (nonatomic, retain) RMSubcategory     *subcategory;
@property (nonatomic, retain) NSData            *imageData;
@property (nonatomic, retain) NSString          *imageURL;
@property (nonatomic, retain) NSNumber          *price;

@end
