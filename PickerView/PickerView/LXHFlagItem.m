//
//  LXHFlagItem.m
//  PickerView
//
//  Created by moxuyou on 16/6/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHFlagItem.h"

@implementation LXHFlagItem

+ (instancetype)flageWithDict:(NSDictionary *)dict
{
    LXHFlagItem *flag = [[self alloc] init];
    // 利用KVC字典转模型
    [flag setValuesForKeysWithDictionary:dict];
    
    return flag;
}

@end
