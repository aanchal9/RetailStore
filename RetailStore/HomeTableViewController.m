//
//  HomeTableViewController.m
//  RetailStore
//
//  Created by Aanchal Arora on 29/07/15.
//  Copyright (c) 2015 Aanchal Arora. All rights reserved.
//

#import "HomeTableViewController.h"
#import "Item.h"
#import "ItemDetailsViewController.h"
#import "ItemsTableViewController.h"
#import "GlobalObjects.h"
#import "CartTableViewController.h"

@interface HomeTableViewController ()

@property NSDictionary *items;

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
   
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Cart" style:UIBarButtonItemStylePlain target:self action:@selector(showCart)];
    
    GlobalObjects *globals = [GlobalObjects sharedInstance];
    _items = globals.itemCategories;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [_items count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[_items valueForKey:([_items allKeys][section]) ] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }

    NSDictionary *categoryDictionary = [_items valueForKey:[_items allKeys][indexPath.section]];
    cell.textLabel.text = [categoryDictionary allKeys][indexPath.row];
    cell.detailTextLabel.text = [categoryDictionary valueForKey:[categoryDictionary allKeys][indexPath.row]];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_items allKeys][section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemsTableViewController *itemsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemsTableViewController"];
    itemsViewController.category = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [self.navigationController pushViewController:itemsViewController animated:YES];
    
}

- (void)logout
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showCart
{
    CartTableViewController *cartViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CartTableViewController"];
    [self.navigationController pushViewController:cartViewController animated:YES];
}

@end
