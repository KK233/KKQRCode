//
//  KKBackgroundView.h
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/5.
//  Copyright © 2015年 ZYB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKBackgroundView : UIView

@property (nonatomic, assign) CGRect interestRect;

- (instancetype)initWithInterestRect:(CGRect)intersetRect;
@end
