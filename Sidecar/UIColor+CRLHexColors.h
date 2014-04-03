#import <UIKit/UIKit.h>

@interface UIColor (CRLHexColors)

// These take RGB hex: 0xrrggbb

/**
 Returns a UIColor from a hexadecimal representation of its RGB components,
 as 0xrrggbb, with the given alpha.
 */
+(UIColor *)crl_colorWithHex:(uint)hex alpha:(CGFloat)alpha;

/**
 Returns a UIColor from a hexadecimal representation of its RGB components,
 as 0xrrggbb, with an alpha of 1.0.
 */
+(UIColor *)crl_colorWithHex:(uint)hex;

/**
 Returns a UIColor from a string representation of its RGB components, in one
 of the following formats, optionally prefixed with "#", "0x", or "0X":
 
 rrggbb (e.g. "#ffef0f" or "0xFFEf52")
 
 rgb (which performs the usual CSS duplication of components -- e.g. "#abc" is the same as "#aabbcc").
 
 @returns A UIColor instance, or nil if the string is not in one of the above formats.
 */
+(UIColor *)crl_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 Returns a UIColor from a string representation of its RGB components, in one
 of the following formats, optionally prefixed with "#", "0x", or "0X":

 rrggbb (e.g. "#ffef0f" or "0xFFEf52")

 rgb (which performs the usual CSS duplication of components -- e.g. "#abc" is the same as "#aabbcc").
 
 @returns A UIColor instance, or nil if the string is not in one of the above formats.
 */
+(UIColor *)crl_colorWithHexString:(NSString *)hexString;

@end