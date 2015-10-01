//
//  GlobalObjects.h
//  RetailStore
//
//  Created by Aanchal Arora on 29/07/15.
//  Copyright (c) 2015 Aanchal Arora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalObjects : NSObject

+ (GlobalObjects *)sharedInstance;

@property NSDictionary *itemCategories;
@property (strong, nonatomic, readwrite) NSMutableArray *cart;

@end
