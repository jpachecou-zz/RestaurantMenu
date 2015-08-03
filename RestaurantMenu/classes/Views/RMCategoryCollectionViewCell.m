//
//  RMCategoryCollectionViewCell.m
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 2/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import "RMCategoryCollectionViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "RMCoreDataHelper.h"

@interface RMCategoryCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView    *imageView;
@property (nonatomic, weak) IBOutlet UILabel        *subcategoryNameLabel;
@property (nonatomic, weak) IBOutlet UILabel        *subcategoryDescriptionLabel;

@end

@implementation RMCategoryCollectionViewCell

- (void)setSubcategory:(RMSubcategory *)subcategory {
    _subcategory = subcategory;
    NSURL *url = [NSURL URLWithString:subcategory.imageURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.subcategoryNameLabel.text = subcategory.name;
    self.subcategoryDescriptionLabel.text = subcategory.subcategoryDescription;
    if (subcategory.imageData) {
        self.imageView.image = [UIImage imageWithData:subcategory.imageData];
    } else{
        [self.imageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            [subcategory setImageData:UIImagePNGRepresentation(image)];
            [[RMCoreDataHelper sharedInstance] saveContext];
            self.imageView.image = image;
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            RKLogError(@"Load failed with error: %@", error);
        }];
    }
}

@end
