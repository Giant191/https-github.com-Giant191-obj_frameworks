//
//  MyFramework.h
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/2/22.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(int,MyColorType) {
    
    MyBackgroundColor = 0,
    MyNavigationColor,
    MyTabBarColor
    
};

@interface MyFramework : NSObject

NS_ASSUME_NONNULL_BEGIN

+ (UIColor *)getCustomColor:(MyColorType)type;

+ (CGFloat)getRGBFloat:(CGFloat)value;

+ (void)createAlertControllerTitle:(NSString *)title alertMessage:(NSString *)alermessage CancelTitle:(NSString *)cancelTitle CreateViewController:(UIViewController *)createViewController;

+ (void)getImageWithURL:(NSString *)urlstring Completion:(void (^)(UIImage * _Nonnull))completion;

+ (void)getJsonWithURL:(NSString *)urlstring Completion:(void (^)(NSArray * _Nonnull))completion;

+ (void)postJsonWithURL:(NSString *)urlstring Value:(NSString *)value Completion:(void (^)(NSArray * _Nonnull))completion;

+ (NSString *)md5:(NSString *)input;

NS_ASSUME_NONNULL_END

@end

@interface CustomActivityIndicatorView : UIActivityIndicatorView

NS_ASSUME_NONNULL_BEGIN

+ (instancetype)shareInstance;

- (instancetype)init;

- (void)start;

- (void)stop;

NS_ASSUME_NONNULL_END

@end

