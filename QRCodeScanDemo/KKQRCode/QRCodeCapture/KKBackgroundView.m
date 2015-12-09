//
//  KKBackgroundView.m
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/5.
//  Copyright © 2015年 ZYB. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "KKBackgroundView.h"

@implementation KKBackgroundView

- (instancetype)initWithInterestRect:(CGRect)intersetRect {
    self.interestRect = intersetRect;
    return [super initWithFrame:[UIScreen mainScreen].bounds];
}

//#warning self.opaque写在这不好使, 为什么??
- (instancetype)initWithFrame:(CGRect)frame {
    return [super initWithFrame:frame];
}

// draw hud
- (void)drawRect:(CGRect)rect {
    //set context
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.5);
    
    /**
     *  set hud
     */
    CGRect hudRect = CGRectZero;
    //set top hud
    hudRect = CGRectMake(0, 0, kScreenWidth, CGRectGetMinY(self.interestRect));
    CGContextFillRect(context, hudRect);
    
    //set bottom hud
    hudRect.origin.y = CGRectGetMaxY(self.interestRect);
    CGContextFillRect(context, hudRect);
    
    //set left hud
    hudRect = CGRectMake(0, CGRectGetMinY(self.interestRect), CGRectGetMinX(self.interestRect), self.interestRect.size.height);
    CGContextFillRect(context, hudRect);
    
    //set right hud
    hudRect.origin.x = CGRectGetMaxX(self.interestRect);
    CGContextFillRect(context, hudRect);
    
    CGContextStrokePath(context);
    
    /**
     *  set corner
     */
    CGFloat lineLength = 10.0;
    CGFloat lineWidth = 4.0;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = lineWidth;
    
    //left top vertical
    [bezierPath moveToPoint:CGPointMake(self.interestRect.origin.x, self.interestRect.origin.y + lineLength)];
    [bezierPath addLineToPoint:self.interestRect.origin];
    //left top horizontal
    [bezierPath addLineToPoint:CGPointMake(self.interestRect.origin.x + lineLength, self.interestRect.origin.y)];
    
    //right top vertical
    [bezierPath moveToPoint:CGPointMake(CGRectGetMaxX(self.interestRect), self.interestRect.origin.y + lineLength)];
    [bezierPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.interestRect), self.interestRect.origin.y)];
    //right top horizontal
    [bezierPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.interestRect) - lineLength, self.interestRect.origin.y)];
    
    //left bottom vertical
    [bezierPath moveToPoint:CGPointMake(self.interestRect.origin.x, CGRectGetMaxY(self.interestRect) - lineLength)];
    [bezierPath addLineToPoint:CGPointMake(self.interestRect.origin.x, CGRectGetMaxY(self.interestRect))];
    //left bottom horizontal
    [bezierPath addLineToPoint:CGPointMake(self.interestRect.origin.x + lineLength, CGRectGetMaxY(self.interestRect))];
    
    //right bottom vertical
    [bezierPath moveToPoint:CGPointMake(CGRectGetMaxX(self.interestRect), CGRectGetMaxY(self.interestRect) - lineLength)];
    [bezierPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.interestRect), CGRectGetMaxY(self.interestRect))];
    //right bottom horizontal
    [bezierPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.interestRect) - lineLength, CGRectGetMaxY(self.interestRect))];
    [[UIColor redColor] setStroke];
    [bezierPath stroke];
}

@end
