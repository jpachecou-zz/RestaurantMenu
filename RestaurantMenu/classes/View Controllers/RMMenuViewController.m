//
//  RMMenuViewController.m
//  restaurant-menu
//
//  Created by Jonathan Pacheco on 30/07/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import "RMMenuViewController.h"
#import "RMCategoryViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RMCategory.h"
#import "RMCategoryCollectionViewCell.h"
#import "UICollectionViewCell+RMRegisterCell.h"
#import "RMCategoryCollectionReusableView.h"
#import "RMItemsCollectionViewController.h"

@interface RMMenuViewController ()<UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) RMCategoryViewModel *viewModel;

@end

@implementation RMMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeComponents];
    [self bindViewModel];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeComponents {
    [RMCategoryCollectionViewCell       registerCellInCollectionView:self.collectionView];
    [RMCategoryCollectionReusableView   registerCellInCollectionView:self.collectionView];
}

- (void)bindViewModel {
    self.viewModel = [RMCategoryViewModel viewModel];
    [RACObserve(self.viewModel, categories) subscribeNext:^(id x) {
        [self.collectionView reloadData];
    }];
}

#pragma mark - Collection view data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.viewModel.categories.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return ((RMCategory *)self.viewModel.categories[section]).subcategories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RMCategory *category = self.viewModel.categories[indexPath.section];
    RMCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[RMCategoryCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    [cell setSubcategory:category.subcategories.allObjects[indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    RMCategoryCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[RMCategoryCollectionReusableView cellIdentifier] forIndexPath:indexPath];
    [reusableView setCategory:self.viewModel.categories[indexPath.row]];
    return reusableView;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        if ([sender isKindOfClass:[NSArray class]]) {
            RMItemsCollectionViewController *controller;
            if ([segue.destinationViewController isKindOfClass:UINavigationController.class]) {
                controller = (RMItemsCollectionViewController *)[segue.destinationViewController topViewController];
            } else {
                controller = (RMItemsCollectionViewController *)segue.destinationViewController;
            }
            [controller setItems:sender];
        }
    }
}

#pragma mark Collection view delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    RMCategory *category = self.viewModel.categories[indexPath.section];
    RMSubcategory *subcategory = category.subcategories.allObjects[indexPath.row];
    [self performSegueWithIdentifier:@"showDetail" sender:subcategory.items.allObjects];
}

#pragma mark Collection view delegate layout flow

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(CGRectGetWidth(self.view.frame), 44.f);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth(self.view.frame), 128.f);
}

@end
