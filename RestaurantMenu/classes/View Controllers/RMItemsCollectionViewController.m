//
//  RMItemsCollectionViewController.m
//  RestaurantMenu
//
//  Created by Jonathan Pacheco on 2/08/15.
//  Copyright (c) 2015 Grability. All rights reserved.
//

#import "RMItemsCollectionViewController.h"
#import <VCTransitionsLibrary/CEFoldAnimationController.h>
#import "RMItemCollectionViewCell.h"
#import "UICollectionViewCell+RMRegisterCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RMItemDetailViewController.h"
#import "RMItem.h"
#import "RMUtil.h"

@interface RMItemsCollectionViewController ()<UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate>

@end

@implementation RMItemsCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeComponents];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeComponents {
    [RMItemCollectionViewCell registerCellInCollectionView:self.collectionView];
    
    self.navigationController.delegate = self;
}

- (void)bindViewModel {
    [RACObserve(self, items) subscribeNext:^(id x) {
        [self.collectionView reloadData];
    }];
}

#pragma mark - Collection view data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RMItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[RMItemCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    [cell setItem:self.items[indexPath.row]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showItemDetail"]) {
        if ([sender isKindOfClass:RMItem.class]) {
            [((RMItemDetailViewController *)segue.destinationViewController) setItem:sender];
        }
    }
}

#pragma mark Collection view degegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showItemDetail" sender:self.items[indexPath.row]];
}

#pragma mark Collection view delegate flow layout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat divisor = (CGRectGetWidth(self.view.frame) > 480 || [RMUtil isIPad]) ? 2 : 1;
    return CGSizeMake(CGRectGetWidth(self.view.frame) / divisor, 144.f);
}

#pragma mark - Navigation controller delegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    CEReversibleAnimationController *animation = [[CEFoldAnimationController alloc] init];
    animation.reverse = operation == UINavigationControllerOperationPush;
    return animation;
}


@end
