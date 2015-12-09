//
//  KKTabBarController.m
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/4.
//  Copyright © 2015年 ZYB. All rights reserved.
//

#import "KKTabBarController.h"

@interface KKTabBarController ()

@end

@implementation KKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.childViewControllers[0].title = @"相机读取";
    self.childViewControllers[1].title = @"相册读取";
    self.childViewControllers[2].title = @"二维码生成";
//    self.childViewControllers[1].title = @"生成二维码";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
