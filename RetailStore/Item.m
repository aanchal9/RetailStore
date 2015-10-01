//
//  Item.m
//  RetailStore
//
//  Created by Aanchal Arora on 29/07/15.
//  Copyright (c) 2015 Aanchal Arora. All rights reserved.
//

#import "Item.h"

@implementation Item

-(id)initWithItemImage:(NSString *)image itemName:(NSString *)name itemPrice:(float)price
{
    self = [super init];
    if (self) {
        _itemImage = image;
        _itemName = name;
        _itemPrice = price;
    }
    return self;
}

-(id)init
{
    return [self initWithItemImage:nil itemName:nil itemPrice:0];
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder
{
    [aCoder encodeObject:_itemImage forKey:@"itemImage"];
    [aCoder encodeObject:_itemName forKey:@"itemName"];
    [aCoder encodeFloat:_itemPrice forKey:@"itemPrice"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _itemImage = [aDecoder decodeObjectForKey:@"itemImage"];
        _itemName = [aDecoder decodeObjectForKey:@"itemName"];
        _itemPrice = [aDecoder decodeFloatForKey:@"itemPrice"];
    }
    return self;
}


@end
