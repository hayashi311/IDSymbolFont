//
//  Created by CocoaPods on TODAYS_DATE.
//  Copyright (c) 2014 PROJECT_OWNER. All rights reserved.
//

#import "UIFont+IDSymbolFont.h"
@import CoreText;

@interface IDBundleKey : NSObject
@end
@implementation IDBundleKey
@end

NSString *const kIDSymbolFontFamilyName = @"icons";

@implementation UIFont (IDSymbolFont)

+ (instancetype)id_symbolFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:kIDSymbolFontFamilyName size:size];
    if (!font) {
        NSBundle* bundle = [NSBundle bundleForClass:[IDBundleKey class]];
        NSString *fontPath = [bundle pathForResource:kIDSymbolFontFamilyName ofType:@"ttf"];
        NSData *inData = [NSData dataWithContentsOfFile:fontPath];
        CFErrorRef error;
        CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)inData);
        CGFontRef cgFont = CGFontCreateWithDataProvider(provider);
        if (! CTFontManagerRegisterGraphicsFont(cgFont, &error)) {
            CFStringRef errorDescription = CFErrorCopyDescription(error);
            NSLog(@"Failed to load font: %@", errorDescription);
            CFRelease(errorDescription);
        }
        CFRelease(cgFont);
        CFRelease(provider);
        font = [UIFont fontWithName:kIDSymbolFontFamilyName size:size];
    }
    return font;
}

@end
