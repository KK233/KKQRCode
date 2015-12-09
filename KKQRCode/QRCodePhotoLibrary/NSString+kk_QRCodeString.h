//
//  NSString+kk_QRCodeString.h
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/7.
//  Copyright © 2015年 ZYB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (kk_QRCodeString)


/**
 *  category with NSString, return the QRCode message by UIImage
 *
 *  @param image the QRCode Image
 *
 *  @return QRCode message string
 */
+ (NSString *)kk_QRCodeStringWithImage:(UIImage *)image;

@end
