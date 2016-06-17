//
//  LXHimagePickView.m
//  PickerView
//
//  Created by moxuyou on 16/6/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHimagePickView.h"
#import "LXHFlagItem.h"
#import "LXHFlagView.h"

@interface LXHimagePickView ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic, strong) NSMutableArray *flags;
@end

@implementation LXHimagePickView

- (NSMutableArray *)flags
{
    if (_flags == nil) {
        
        // 装flag模型
        _flags = [NSMutableArray array];
        
        // 加载plist
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
        
        for (NSDictionary *dict in arr) {
            // 字典转模型
            LXHFlagItem *flag = [LXHFlagItem flageWithDict:dict];
            
            [_flags addObject:flag];
            
        }
    }
    return _flags;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _pickerView.dataSource = self;
    
    _pickerView.delegate = self;
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return self.flags.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    LXHFlagView *flagView = [[NSBundle mainBundle] loadNibNamed:@"LXHFlagView" owner:nil options:nil][0];
    
    // 取出对应的模型
    LXHFlagItem *flag = self.flags[row];
    flagView.flag = flag;
    
    return flagView;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
