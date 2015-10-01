//
//  CartTableViewController.m
//  RetailStore
//
//  Created by Aanchal Arora on 29/07/15.
//  Copyright (c) 2015 Aanchal Arora. All rights reserved.
//

#import "CartTableViewController.h"
#import "GlobalObjects.h"
#import "Item.h"
#import "ItemDetailsViewController.h"

@interface CartTableViewController ()

@property NSMutableArray *cart;
@property float totalAmount;

@end

@implementation CartTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GlobalObjects *globals = [GlobalObjects sharedInstance];
    _cart = globals.cart;
    
    for (Item *item in _cart) {
        _totalAmount += item.itemPrice;
    }
    if (_totalAmount > 0.0) {
    
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:[NSString stringWithFormat:@"%.2f", _totalAmount] style:UIBarButtonItemStylePlain target:self action:nil];
    }
    self.navigationItem.title = @"Cart";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _cart.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.textLabel setNumberOfLines:0];
    cell.textLabel.text = [_cart[indexPath.row] itemName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", [(Item *)_cart[indexPath.row] itemPrice]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemDetailsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemDetailsViewController"];
    controller.item = _cart[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        _totalAmount -= ((Item *)_cart[indexPath.row]).itemPrice;
        self.navigationItem.rightBarButtonItem.title = [NSString stringWithFormat:@"%.2f", _totalAmount];
        ((Item *)_cart[indexPath.row]).inCart = NO;
        [_cart removeObjectAtIndex:indexPath.row];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:_cart] forKey:@"cart"];
        [defaults synchronize];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

@end
