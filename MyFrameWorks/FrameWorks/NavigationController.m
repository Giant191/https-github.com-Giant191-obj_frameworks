//
//  NavigationController.m
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/2/14.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import "NavigationController.h"

@implementation NavigationController

+ (UINavigationController *)ViewController:(UIViewController *)myViewController TabBarTitle:(NSString *)myTabBarTitle TabBarImage:(UIImage *)myTabBarImage SelectTabBarImage:(UIImage *)mySelectTabBarImage {
    
    UINavigationController *myNavigationController = [[UINavigationController alloc] initWithRootViewController:myViewController];
    
    myNavigationController.tabBarItem.title = myTabBarTitle;
    
    [myNavigationController.navigationBar setBarTintColor:[UIColor colorWithRed:(210.0f/255) green:(84.0f/255.0f) blue:(75.0f/255.0f) alpha:1]];
//    myNavigationController.view.backgroundColor = [UIColor colorWithRed:(255/255) green:(53/255) blue:(154/255) alpha:1];
    
    [myNavigationController.tabBarItem setImage:[[self imageWithImage:myTabBarImage scaledToSize:CGSizeMake(45, 45)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    myNavigationController.tabBarItem.selectedImage = [[self imageWithImage:mySelectTabBarImage scaledToSize:CGSizeMake(45, 45)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //無文字時，圖片置中
    myNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    myNavigationController.navigationBar.translucent = NO;
    
//    myNavigationController.view.backgroundColor = [UIColor whiteColor];
    
    return myNavigationController;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
