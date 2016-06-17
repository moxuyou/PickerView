//
//  LXHFlagView.m
//  PickerView
//
//  Created by moxuyou on 16/6/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHFlagView.h"
#import "LXHFlagItem.h"

@interface LXHFlagView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
@implementation LXHFlagView

- (void)setFlag:(LXHFlagItem *)flag
{
    _flag = flag;
    
    // 给子控件赋值
    self.label.text = flag.name;
    self.imageView.image = [UIImage imageNamed:flag.icon];
}

@end
