//
//  LXHDatePickerVC.m
//  PickerView
//
//  Created by moxuyou on 16/6/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHDatePickerVC.h"

@interface LXHDatePickerVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *birthdayField;

@property (nonatomic, weak) UIDatePicker *datePicker;

@end

@implementation LXHDatePickerVC

// 是否允许用户输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return NO;
}

// 文本框开始编辑的时候调用
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // 给生日文本框赋值
    [self dateChange:_datePicker];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _birthdayField.delegate = self;
    
    // 自定义生日键盘
    [self setUpBirthdayKeyboard];
}

// 自定义生日键盘
- (void)setUpBirthdayKeyboard
{
    // 创建UIDatePicker
    // 注意：UIDatePicker有默认的尺寸，可以不用设置frame
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    
    _datePicker = picker;
    
    // 设置地区 zh:中国
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    // 设置日期的模式
    picker.datePickerMode = UIDatePickerModeDate;
    
    // 监听UIDatePicker的滚动
    [picker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    
    _birthdayField.inputView = picker;
}

// 当UIDatePicker滚动的时候调用
// 给生日文本框赋值
- (void)dateChange:(UIDatePicker *)datePicker
{
    NSLog(@"%@",datePicker.date);
    // 日期转换字符串
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr = [fmt stringFromDate:datePicker.date];
    
    _birthdayField.text = dateStr;
}

- (IBAction)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
