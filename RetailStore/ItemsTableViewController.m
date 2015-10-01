//
//  ItemsTableViewController.m
//  RetailStore
//
//  Created by Aanchal Arora on 30/07/15.
//  Copyright (c) 2015 Aanchal Arora. All rights reserved.
//

#import "ItemsTableViewController.h"
#import "GlobalObjects.h"
#import "Item.h"
#import "ItemDetailsViewController.h"
#import "CartTableViewController.h"

@interface ItemsTableViewController ()

@property NSDictionary *itemCategory;
@property NSArray *items;

@end

@implementation ItemsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _category;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Cart" style:UIBarButtonItemStylePlain target:self action:@selector(showCart)];
    
    _itemCategory = @{ @"Television" : @1, @"Microwave Oven" : @2, @"Vacuum Cleaner" : @3, @"Table" : @4, @"Chair" : @5, @"Almirah" : @6};

    NSInteger value = [[_itemCategory valueForKey:_category] integerValue];
    
    switch (value) {
        case 1:
        {
            Item *item1 = [[Item alloc]initWithItemImage:@"tv1.jpg" itemName:@"Samsung FH4003 81 cm (32 inches) HD Ready LED TV (Black) by Samsung" itemPrice:27900];
            Item *item2 = [[Item alloc]initWithItemImage:@"tv2.jpg" itemName:@"Sony Bravia KLV-24P422B 59.8 cm (24 inches) WXGA LED TV (Black) by Sony" itemPrice:16900];
            _items = [NSArray arrayWithObjects:item1, item2, nil];
        }
        break;
        case 2:
        {
            Item *item1 = [[Item alloc]initWithItemImage:@"oven1.jpg" itemName:@"Samsung MW73AD-B/XTL 20-Litre 800-Watt Solo Microwave Oven" itemPrice:27900];
            Item *item2 = [[Item alloc]initWithItemImage:@"oven2.jpg" itemName:@"Morphy Richards 23MCG 23-Litre Convection Microwave Oven (Black)" itemPrice:16900];
            _items = [NSArray arrayWithObjects:item1, item2, nil];
        }
        break;
        case 3:
        {
            Item *item1 = [[Item alloc]initWithItemImage:@"vacuum1.jpg" itemName:@"Eureka Forbes Trendy Nano 1000-Watt Handheld Vacuum Cleaner with Reusable Dust Bag (Red)" itemPrice:27900];
            Item *item2 = [[Item alloc]initWithItemImage:@"vacuum2.jpg" itemName:@"Philips MiniVac FC6130 900-Watt Handheld Vacuum Cleaner" itemPrice:16900];
            _items = [NSArray arrayWithObjects:item1, item2, nil];
        }
        break;
        case 4:
        {
            Item *item1 = [[Item alloc]initWithItemImage:@"table1.jpeg" itemName:@"Loxia Greenwood03 Plywood Side Table" itemPrice:27900];
            Item *item2 = [[Item alloc]initWithItemImage:@"table2.jpeg" itemName:@"Decorhand Rosewood (Sheesham) Side Table" itemPrice:16900];
            _items = [NSArray arrayWithObjects:item1, item2, nil];
        }
        break;
        case 5:
        {
            Item *item1 = [[Item alloc]initWithItemImage:@"chair2.jpg" itemName:@"CHROMECRAFT MARINA OFFICE AND STUDY CHAIR" itemPrice:27900];
            Item *item2 = [[Item alloc]initWithItemImage:@"chair1.jpeg" itemName:@"RVF Mango Wood Chair" itemPrice:16900];
            _items = [NSArray arrayWithObjects:item1, item2, nil];
        }
        break;
        case 6:
        {
            Item *item1 = [[Item alloc]initWithItemImage:@"almirah1.jpeg" itemName:@"CbeeSo Stainless Steel Collapsible Wardrobe" itemPrice:27900];
            Item *item2 = [[Item alloc]initWithItemImage:@"almirah2.jpeg" itemName:@"CbeeSo Stainless Steel Collapsible Wardrobe" itemPrice:16900];
            _items = [NSArray arrayWithObjects:item1, item2, nil];
        }

            
        default:
            break;
    }
    
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
    
    return [_items count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    
    cell.textLabel.text = ((Item *)_items[indexPath.row]).itemName;
    [cell.textLabel setNumberOfLines:0];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", ((Item *)_items[indexPath.row]).itemPrice];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemDetailsViewController *itemViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemDetailsViewController"];
    itemViewController.item = _items[indexPath.row];
    [self.navigationController pushViewController:itemViewController animated:YES];
    
}

- (void)showCart
{
    CartTableViewController *cartViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CartTableViewController"];
    [self.navigationController pushViewController:cartViewController animated:YES];
}


@end
