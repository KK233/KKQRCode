//
//  KKScanGeneralViewController.m
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/4.
//  Copyright © 2015年 ZYB. All rights reserved.
//

#import "KKScanGeneralViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "KKQRCodeCaptureView.h"

@interface KKScanGeneralViewController () <KKQRCodeCaptureViewDelegate>

@property(nonatomic, strong) KKQRCodeCaptureView *captureView;
@end

@implementation KKScanGeneralViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    KKQRCodeCaptureView *view = [KKQRCodeCaptureView captureView];
    self.captureView = view;
    view.delegate = self;
    [self.view addSubview:view];
    
    [self.captureView startReadingQRCode];
}

- (void)alertViewWithMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"二维码信息" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    typeof (self)weakSelf = self;
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf.captureView startReadingQRCode];
    }];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)captureView:(KKQRCodeCaptureView *)captureView didReceiveAVMetadataMachineReadableCodeObjects:(NSArray *)objects {
    AVMetadataMachineReadableCodeObject *object = objects.firstObject;
    [self.captureView stopReadingQRCode];
    [self alertViewWithMessage:object.stringValue];
}


@end
