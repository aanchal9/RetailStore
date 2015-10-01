//
//  GlobalObjects.m
//  RetailStore
//
//  Created by Aanchal Arora on 29/07/15.
//  Copyright (c) 2015 Aanchal Arora. All rights reserved.
//

#import "GlobalObjects.h"


@implementation GlobalObjects

+ (GlobalObjects *)sharedInstance {
    static dispatch_once_t onceToken;
    static GlobalObjects *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[GlobalObjects alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        
        _itemCategories = @{ @"Electronics" : @{ @"Television" : @"2", @"Microwave Oven" : @"2", @"Vacuum Cleaner" : @"2"},
                             @"Furniture" : @{ @"Table" : @"2", @"Chair" : @"2", @"Almirah" : @"2"}};
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        NSData *cartData = [userDefaults objectForKey:@"cart"];
        
        if (cartData == nil) {
            _cart = [[NSMutableArray alloc]init];
        }
        else{
            
            _cart = [NSKeyedUnarchiver unarchiveObjectWithData:cartData];
            
        }
        
    }
    return self;
}


@end
