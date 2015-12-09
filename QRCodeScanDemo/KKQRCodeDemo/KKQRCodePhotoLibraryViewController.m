//
//  KKQRCodePhotoLibraryViewController.m
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/7.
//  Copyright © 2015年 ZYB. All rights reserved.
//

#import "KKQRCodePhotoLibraryViewController.h"
#import "NSString+kk_QRCodeString.h"

@interface KKQRCodePhotoLibraryViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation KKQRCodePhotoLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)buttonClick:(UIButton *)sender {
    [self presentImagePickerController];
}

- (void)presentImagePickerController {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)alertViewWithMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"二维码信息" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
   NSString *message =[NSString kk_QRCodeStringWithImage:info[UIImagePickerControllerOriginalImage]];
    [self alertViewWithMessage:message];
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
