//
//  Item.h
//  RetailStore
//
//  Created by Aanchal Arora on 29/07/15.
//  Copyright (c) 2015 Aanchal Arora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject<NSCoding>

@property NSString *itemImage;
@property NSString *itemName;
@property float itemPrice;
@property (getter=isInCart) BOOL inCart;

-(id)initWithItemImage:(NSString *)image itemName:(NSString *)name itemPrice:(float)price;

@end
