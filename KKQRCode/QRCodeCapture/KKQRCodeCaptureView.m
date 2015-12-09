//
//  KKQRCodeCaptureView.m
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/4.
//  Copyright © 2015年 ZYb. All rights reserved.
//

/*
 
 怎么写:
 
 写初始化方法
 output的代理方法,在其中写代理反馈数据
 写默认的getter,已经自定义接口的setter
 
 */

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


#import <AVFoundation/AVFoundation.h>
#import "KKQRCodeCaptureView.h"
#import "KKBackgroundView.h"
@interface KKQRCodeCaptureView () <AVCaptureMetadataOutputObjectsDelegate>

/**
 * basic setting for capture
 */
@property (nonatomic, strong) AVCaptureDevice *device;
@property (nonatomic, strong) AVCaptureDeviceInput *input;
@property (nonatomic, strong) AVCaptureMetadataOutput *output;
@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *preView;

@property (nonatomic, assign) CGRect interestRect;
@end

@implementation KKQRCodeCaptureView

#pragma mark - Public Method
+ (instancetype)captureView {
    return [KKQRCodeCaptureView captureViewWithRectOfInterest:CGRectNull sessionPresetType:nil];
}

+ (instancetype)captureViewWithRectOfInterest:(CGRect)rect {
    return [KKQRCodeCaptureView captureViewWithRectOfInterest:rect sessionPresetType:nil];
}

+ (instancetype)captureViewWithRectOfInterest:(CGRect)rect
                         sessionPresetType:(NSString *)AVCaptureSessionPresetType {
   if (CGRectIsNull(rect)) {
       CGRect frame = CGRectZero;
       frame.size.width = 200;
       frame.size.height = 200;
       frame.origin.x = [UIScreen mainScreen].bounds.size.width * 0.5 - frame.size.width * 0.5;
       frame.origin.y = [UIScreen mainScreen].bounds.size.height * 0.5 - frame.size.height * 0.5;
       rect = frame;
   }
    
    if (AVCaptureSessionPresetType == nil) {
        AVCaptureSessionPresetType = AVCaptureSessionPresetHigh;
    }
    
    KKQRCodeCaptureView *captureView = [[KKQRCodeCaptureView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    captureView.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    captureView.input = [AVCaptureDeviceInput deviceInputWithDevice:captureView.device error:nil];
    captureView.output = [[AVCaptureMetadataOutput alloc] init];
    [captureView.output setMetadataObjectsDelegate:captureView queue:dispatch_get_main_queue()];
    captureView.interestRect = rect;
    
    //background view
    KKBackgroundView *backgroundView = [[KKBackgroundView alloc] initWithInterestRect:rect];
    backgroundView.opaque = NO;
    [captureView addSubview:backgroundView];
 
    //capture rect with 0~1, and rect make as (y, x, height, width)
    CGRect rectOFinterest = CGRectMake(
                                       (1.0 - rect.size.height / kScreenHeight) / 2.0,
                                       (1.0 - rect.size.width / kScreenWidth) / 2.0,
                                       rect.size.height / kScreenHeight,
                                       rect.size.width / kScreenWidth
                                       );
    captureView.output.rectOfInterest = rectOFinterest;
    
    //session
    captureView.session = [[AVCaptureSession alloc] init];
    [captureView.session setSessionPreset:AVCaptureSessionPresetType];
    [captureView.session addInput:captureView.input];
    [captureView.session addOutput:captureView.output];
//    captureView.output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode];
    captureView.output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    //preview layer set
    captureView.preView = [AVCaptureVideoPreviewLayer layerWithSession:captureView.session];
    captureView.preView.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [captureView.layer insertSublayer:captureView.preView atIndex:0];
    captureView.preView.frame = [UIScreen mainScreen].bounds;
    
    return captureView;
}

- (void)startReadingQRCode {
    [self.session startRunning];
}

- (void)stopReadingQRCode {
    [self.session stopRunning];
}




#pragma mark - AVCaptureMetadataOutputObjectsDelegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects.count == 0) {
        return;
    }
//        if (metadataObjects.count > 0) {
//            [self.session stopRunning];
//    
//            typeof (self)weakSelf = self;
//            dispatch_time_t delayTime = DISPATCH_TIME_NOW + 3.0;
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [weakSelf.session startRunning];
//            });
//        }
    if ([self.delegate respondsToSelector:@selector(captureView:didReceiveAVMetadataMachineReadableCodeObjects:)]) {
        [self.delegate captureView:self didReceiveAVMetadataMachineReadableCodeObjects:metadataObjects];
    }
}


#pragma mark - setter / getter
@end

