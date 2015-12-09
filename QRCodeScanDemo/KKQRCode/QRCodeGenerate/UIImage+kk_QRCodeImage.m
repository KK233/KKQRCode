//
//  UIImage+kk_QRCodeImage.m
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/8.
//  Copyright © 2015年 ZYB. All rights reserved.
//

#import "UIImage+kk_QRCodeImage.h"

@implementation UIImage (kk_QRCodeImage)


+ (UIImage *)kk_GenerateQRCodeImageWithString:(NSString *)string size:(CGSize)size {
    UIImage *qrCodeImage = [[UIImage alloc] init];
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    //create filter
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    
    /**        set data color and backgroundcolor if needed
               then outputImage is colorFilter         */
    
    
//    //color for image
//    UIColor *dataColor = [UIColor blackColor];
//    UIColor *backgroundColor = [UIColor whiteColor];
//    
//    //create QRCode filter
//    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"
//                                       keysAndValues:
//                             @"inputImage", filter.outputImage,
//                             @"inputColor0", [CIColor colorWithCGColor:dataColor.CGColor],
//                             @"inputColor1", [CIColor colorWithCGColor:backgroundColor.CGColor],nil];
    //output CI QRCode image
//    CIImage *qrCIImage = colorFilter.outputImage;
    
    //delete if you need data color and background color
    CIImage *qrCIImage = filter.outputImage;
    //draw the image
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:qrCIImage fromRect:qrCIImage.extent];
    
    UIGraphicsBeginImageContext(CGSizeMake(250, 250));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    //reserve image to origin
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    qrCodeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(cgImage);
    
    return qrCodeImage;
}

@end
