# KKQRCode

####/QRCodeScanDemo/KKQRCodeDemo/ is the demo site

####there are three modes

- read QRCode with camera, use QRCodeCapture in /KKQRCode/QRCodeCapture
 - method `+ (instancetype)captureViewWithRectOfInterest:(CGRect)rect` and `+ (instancetype)captureViewWithRectOfInterest:(CGRect)rect
                         sessionPresetType:(NSString *)AVCaptureSessionPresetType`

- read QRCode with photo library, use QRCodePhotoLibrary in /KKQRCode/QRCodePhotoLibrary/
 - method `+ (NSString *)kk_QRCodeStringWithImage:(UIImage *)image`
 - this is category with NSString, return a string

- generate QRCode with string, use /KKQRCode/QRCodeGenerate/
 - method `+ (UIImage *)kk_GenerateQRCodeImageWithString:(NSString *)string size:(CGSize)size`
 - this is category with UIImage,return a image
