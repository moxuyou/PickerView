//
//  LXHCityViewController.m
//  PickerView
//
//  Created by moxuyou on 16/6/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHCityViewController.h"
#import "LXHCityItem.h"

@interface LXHCityViewController ()<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (nonatomic, strong) NSMutableArray *citys;
@property (nonatomic, weak) UIPickerView *pickerView;
@property (nonatomic, assign) NSInteger cityIndex;

@end

@implementation LXHCityViewController

// 懒加载省会
- (NSMutableArray *)citys
{
    if (_citys == nil) {
        // 装所有的省会
        _citys = [NSMutableArray array];
        
        // 加载plist文件
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
        
        for (NSDictionary *dict in arr) {
            // 字典转模型
            LXHCityItem *item = [LXHCityItem cityItemWithDict:dict];
            
            [_citys addObject:item];
        }
    }
    return _citys;
}

#pragma mark - UITextFieldDelegate

// 是否允许用户输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return NO;
}

// 文本框开始编辑的时候调用
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // 给城市文本框赋值
    [self pickerView:_pickerView didSelectRow:0 inComponent:0];
}

#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置文本框的代码
    _cityField.delegate = self;

    // 自定义城市键盘
    [self setUpCityKeyboard];
    
}

#pragma mark - 自定义城市键盘
- (void)setUpCityKeyboard
{
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    
    _pickerView = pickerView;
    
    pickerView.dataSource = self;
    pickerView.delegate = self;
    
    _cityField.inputView = pickerView;
}


#pragma mark -UIPickerView
#pragma mark UIPickerView的数据源
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// pickerView的第0列描述省会，有多少个省
// pickerView的第1列描述选中的省会，有多少个城市
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) { // 描述省会
        
        return self.citys.count;
        
        
    }else{ // 描述选中的省会的城市
        
        // 获取省会
        LXHCityItem *item = self.citys[self.cityIndex];
        
        return item.cities.count;
        
    }
}
#pragma mark -UIPickerView的代理
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) { // 描述省会
        
        // 获取省会
        LXHCityItem *item = self.citys[row];
        return item.name;
        
    }else{ // 描述选中的省会的城市
        // 获取选中的省会的角标
//        NSInteger index = [pickerView selectedRowInComponent:0];
        
        // 获取选中省会
        LXHCityItem *item = self.citys[self.cityIndex];
        
        
        // 当前选中的内蒙古省，只有12个城市，角标0~11，但是右边城市是北京，北京的城市大于12个城市，所以滚动的时候会出现越界。
        
//        NSLog(@"province:%@, count:%ld row:%ld", item.name, item.cities.count, row);
        
        return item.cities[row];
    }
}

// 全局断点就是帮我们定位到出bug的那一行。

// 滚动UIPickerView就会调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) { // 滚动省会,刷新城市（1列）
        
        // 记录当前选中的省会
        self.cityIndex = [pickerView selectedRowInComponent:0];
        
        [pickerView reloadComponent:1];
        
    }
    
    // 给城市文本框赋值
    // 获取选中省会
    LXHCityItem *item = self.citys[self.cityIndex];
    
    // 获取选中的城市
    NSInteger cityIndex = [pickerView selectedRowInComponent:1];
    
    NSString *cityName = item.cities[cityIndex];
    
    _cityField.text = [NSString stringWithFormat:@"%@ %@", item.name,cityName];
}

- (IBAction)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
