//
//  LXHFlagItem.h
//  PickerView
//
//  Created by moxuyou on 16/6/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXHFlagItem : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *icon;

// 写程序一定要有扩展性

// instancetype: 自动识别当前是哪个类在调用，就会变成对应类的对象

// 为什么不用id,id 不能使用点语法
// id 可以调用任何对象的方法，坏处：不利于编译器=检查错误
+ (instancetype)flageWithDict:(NSDictionary *)dict;

@end
