//
//  RMItemCollectionViewCell.m
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 2/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import "RMItemCollectionViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "RMUtil.h"
#import "RMCoreDataHelper.h"

@interface RMItemCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *itemImageView;
@property (nonatomic, weak) IBOutlet UILabel *itemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *itemPriceLabel;
@property (nonatomic, weak) IBOutlet UILabel *itemDescriptionLabel;

@end

@implementation RMItemCollectionViewCell

- (void)setItem:(RMItem *)item {
    _item = item;
    self.itemNameLabel.text         = item.name;
    self.itemDescriptionLabel.text  = item.itemDescription;
    self.itemPriceLabel.text        = [RMUtil currencyFormat:item.price];
    if (item.imageData) {
        self.itemImageView.image = [UIImage imageWithData:item.imageData];
    } else {
        NSURL *url = [NSURL URLWithString:item.imageURL];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.itemImageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            item.imageData = UIImagePNGRepresentation(image);
            self.itemImageView.image = image;
            [[RMCoreDataHelper sharedInstance] saveContext];
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            RKLogError(@"Load failed with error: %@", error);
        }];
    }
}

@end
