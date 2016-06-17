//
//  ViewController.m
//  PickerView
//
//  Created by moxuyou on 16/6/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "ViewController.h"
#import "LXHNormalPickView.h"
#import "LXHimagePickView.h"
#import "LXHDatePickerVC.h"
#import "LXHCityViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//普通
- (IBAction)normal {
    LXHNormalPickView *vc = [[LXHNormalPickView alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    
}
//图文
- (IBAction)imagePickView {
    
    LXHimagePickView *vc = [[LXHimagePickView alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
//城市多组关联
- (IBAction)cityPickView {
    
    LXHCityViewController *vc = [[LXHCityViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    
}
//日期
- (IBAction)datePiakerView:(id)sender {
    LXHDatePickerVC *vc = [[LXHDatePickerVC alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
