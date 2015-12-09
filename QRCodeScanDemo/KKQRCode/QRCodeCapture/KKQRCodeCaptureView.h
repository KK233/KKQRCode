//
//  KKQRCodeCaptureView.h
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/4.
//  Copyright © 2015年 ZYB. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KKQRCodeCaptureView;

@protocol KKQRCodeCaptureViewDelegate <NSObject>

@optional
/**
 *  captureView received objects
 *
 *  @param captureView captureView
 *  @param objects     include internal, corners, stringValue property.see more in AVMetadataObject.h
 */
- (void)captureView:(KKQRCodeCaptureView *)captureView didReceiveAVMetadataMachineReadableCodeObjects:(NSArray *)objects;

@end

@interface KKQRCodeCaptureView : UIView

@property (nonatomic, weak) id<KKQRCodeCaptureViewDelegate> delegate;


/**
 *  default setting to read QRCode
 *
 *  @return KKQRCodeCaptureView
 */
+ (instancetype)captureView;

/**
 *  read QRCode with capture and preview rect
 *
 *  @param rect rect to capture and preview, deafult is half of full screen
 *
 *  @return KKQRCodeCaptureView
 */
+ (instancetype)captureViewWithRectOfInterest:(CGRect)rect;

/**
 *  read QRCode with capture and preview rect, backgroundImage and AVCaptureSessionPreset(Type)
 *
 *  @param rect                       rect to capture and preview, deafult is half of full screen
 *  @param AVCaptureSessionPresetType deafult is AVCaptureSessionPresetHigh,see more
  *                                   in AVCaptureSession.h
 *
 *  @return KKQRCodeCaptureView
 */
+ (instancetype)captureViewWithRectOfInterest:(CGRect)rect
                         sessionPresetType:(NSString *)AVCaptureSessionPresetType;

/**
 *  start reading QRCode
 */
- (void)startReadingQRCode;
/**
 *  stop reading QRCode
 */
- (void)stopReadingQRCode;

@end
