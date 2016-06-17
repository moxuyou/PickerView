//
//  LXHCityItem.h
//  PickerView
//
//  Created by moxuyou on 16/6/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXHCityItem : NSObject

@property (nonatomic, strong) NSArray *cities;

@property (nonatomic, strong) NSString *name;

+ (instancetype)cityItemWithDict:(NSDictionary *)dict;

@end
