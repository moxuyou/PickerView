//
//  LXHNormalPickView.m
//  PickerView
//
//  Created by moxuyou on 16/6/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHNormalPickView.h"

@interface LXHNormalPickView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;
@property (nonatomic, strong) NSArray *foods;

@end

@implementation LXHNormalPickView

- (NSArray *)foods
{
    if (_foods == nil) {
        
        // 加载Pilst文件
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil];
        
        // 大数组：pickerView有多少列
        _foods = [NSArray arrayWithContentsOfFile:filePath];
        
    }
    
    return _foods;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickView.delegate = self;
    
    // 初始化label标题
    
    for (int i = 0; i < 3; i++) {
        
        [self pickerView:self.pickView didSelectRow:0 inComponent:i];
        
    }
}

- (IBAction)randomValue {
    
    // pickerView每一列随机选中一行
    
    // 随机选中的文字展示到label
    
    // cmd + option + [ 代码上跳
    // cmd + [ 代码左移
    for (int i = 0; i < 3; i++) {
        
        // 假设让第0列随机选中一行
        // 取出第0列的行数
        NSInteger count = [self.foods[i] count];
        
        int random = arc4random_uniform((u_int32_t)count);
        // 不会触发代理的选中方法
        [self.pickView selectRow:random inComponent:i animated:YES];
        
        // 主动给label赋值
        [self pickerView:self.pickView didSelectRow:random inComponent:i];
    }
    
}

// 返回pickerView有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foods.count;
}

// 返回第component列有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.foods[component] count];
}

// 返回第component列第row行的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.foods[component][row];
}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 45;
}

// 给label赋值
// 选中第component列第row行的时候调用
// 注意：这个方法必须用户主动拖动pickerView，才会调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    switch (component) {
        case 0:
            // 设置水果
            self.fruitLabel.text = self.foods[component][row];
            break;
        case 1:
            // 设置主食
            self.foodLabel.text = self.foods[component][row];
            break;
        case 2:
            // 设置饮料
            self.drinkLabel.text = self.foods[component][row];
            break;
    }
    
    
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
