//
//  Created by CocoaPods on TODAYS_DATE.
//  Copyright (c) 2014 PROJECT_OWNER. All rights reserved.
//

#import "UIImage+IDSymbolFont.h"
#import "UIFont+IDSymbolFont.h"

@implementation UIImage (IDSymbolFont)

+ (instancetype)id_imageWithSymbolName:(NSString *)symbolName size:(CGFloat)size color:(UIColor *)color {

    UIFont *font = [UIFont id_symbolFontWithSize:size];

    NSDictionary *attributes = @{
            NSFontAttributeName : font,
            NSForegroundColorAttributeName : color
    };
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:symbolName
                                                                           attributes:attributes];

    CGRect textRect = [attributedString boundingRectWithSize:CGSizeMake(1000, 1000)
                                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                                     context:[NSStringDrawingContext new]];
    textRect.origin = CGPointZero;

    UIGraphicsBeginImageContextWithOptions(textRect.size, NO, 0);

    [attributedString drawInRect:textRect];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return image;
}

+ (instancetype)id_templateImageWithSymbolName:(NSString *)symbolName size:(CGFloat)size {
    UIImage *image = [self id_imageWithSymbolName:symbolName size:size color:[UIColor blackColor]];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end