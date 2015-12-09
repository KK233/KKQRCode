//
//  KKQRCodeGenerateViewController.m
//  QRCodeScanDemo
//
//  Created by 张琰博 on 15/12/9.
//  Copyright © 2015年 ZYB. All rights reserved.
//

#import "KKQRCodeGenerateViewController.h"
#import "UIImage+kk_QRCodeImage.h"

@interface KKQRCodeGenerateViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *QRCodeImageVIew;
@property (weak, nonatomic) IBOutlet UITextField *textView;

@end

@implementation KKQRCodeGenerateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)confirmButtonClick:(UIButton *)sender {
    [self.textView resignFirstResponder];
    [self.QRCodeImageVIew setImage:[UIImage kk_GenerateQRCodeImageWithString:self.textView.text size:self.QRCodeImageVIew.frame.size]];
}

@end
