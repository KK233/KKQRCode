//
//  UIImage+kk_QRCodeImage.h
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/8.
//  Copyright © 2015年 ZYB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (kk_QRCodeImage)

/**
 *  return a QRCode Image
 *
 *  @param string QRCode string
 *  @param size   Image size  to return
 *
 *  @return QRCode Image
 */
+ (UIImage *)kk_GenerateQRCodeImageWithString:(NSString *)string size:(CGSize)size;

@end
