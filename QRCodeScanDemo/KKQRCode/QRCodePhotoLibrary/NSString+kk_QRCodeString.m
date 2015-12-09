//
//  NSString+kk_QRCodeString.m
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/7.
//  Copyright © 2015年 ZYB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+kk_QRCodeString.h"

@implementation NSString (kk_QRCodeString)

+ (NSString *)kk_QRCodeStringWithImage:(UIImage *)image {
    
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode
                                              context:nil
                                              options:@{CIDetectorAccuracy: CIDetectorAccuracyHigh}];
    
    CIImage *qrCodeImage = [[CIImage alloc] initWithImage:image];
    CIQRCodeFeature *feature = (CIQRCodeFeature *)[detector featuresInImage:qrCodeImage].firstObject;
    
    return feature.messageString;
}

@end
