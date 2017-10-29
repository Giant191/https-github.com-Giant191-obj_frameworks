//
//  NavigationController.h
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/2/14.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavigationController : NSObject

+ (UINavigationController *)ViewController:(UIViewController *)myViewController TabBarTitle:(NSString *)myTabBarTitle TabBarImage:(UIImage *)myTabBarImage SelectTabBarImage:(UIImage *)mySelectTabBarImage;

@end
