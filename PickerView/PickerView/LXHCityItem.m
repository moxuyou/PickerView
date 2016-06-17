//
//  LXHCityItem.m
//  PickerView
//
//  Created by moxuyou on 16/6/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHCityItem.h"

@implementation LXHCityItem

+ (instancetype)cityItemWithDict:(NSDictionary *)dict
{
    LXHCityItem *item = [[self alloc] init];
    
    [item setValuesForKeysWithDictionary:dict];
    
    return item;
}

@end
