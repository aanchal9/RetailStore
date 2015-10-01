//
//  ItemDetailsViewController.m
//  RetailStore
//
//  Created by Aanchal Arora on 29/07/15.
//  Copyright (c) 2015 Aanchal Arora. All rights reserved.
//

#import "ItemDetailsViewController.h"
#import "GlobalObjects.h"
#import "CartTableViewController.h"

@interface ItemDetailsViewController ()

@end

@implementation ItemDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _itemName.text = _item.itemName;
    _itemPrice.text = [NSString stringWithFormat:@"%.2f", _item.itemPrice];
    [_addToCart setTitle:@"Add To Cart" forState:UIControlStateNormal];
    [_addToCart setTitle:@"Item added to cart" forState:UIControlStateDisabled];
    _itemImage.image = [UIImage imageNamed:_item.itemImage];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Cart" style:UIBarButtonItemStylePlain target:self action:@selector(showCart)];


}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([_item isInCart]) {
        _addToCart.enabled = NO;
    }
    else{
        _addToCart.enabled = YES;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addToCart:(id)sender {
    
    _addToCart.enabled = NO;
    _item.inCart = YES;
    GlobalObjects *globals = [GlobalObjects sharedInstance];
    [globals.cart addObject:_item];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *cartData = [NSKeyedArchiver archivedDataWithRootObject:globals.cart];
    [defaults setObject:cartData forKey:@"cart"];
    [defaults synchronize];

    
}

- (void)showCart
{
    CartTableViewController *cartViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CartTableViewController"];
    [self.navigationController pushViewController:cartViewController animated:YES];
}
@end
