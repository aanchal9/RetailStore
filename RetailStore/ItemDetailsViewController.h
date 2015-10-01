//
//  ItemDetailsViewController.h
//  RetailStore
//
//  Created by Aanchal Arora on 29/07/15.
//  Copyright (c) 2015 Aanchal Arora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface ItemDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemPrice;
@property (weak, nonatomic) IBOutlet UIButton *addToCart;

- (IBAction)addToCart:(id)sender;

@property Item *item;

@end
