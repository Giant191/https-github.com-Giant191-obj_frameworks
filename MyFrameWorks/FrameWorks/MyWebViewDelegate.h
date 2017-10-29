//
//  MyWebViewDelegate.h
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/3/2.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyWebViewDelegate : NSObject <UIWebViewDelegate>

@property (strong, nonatomic) NSString *urllString;

+ (instancetype)shareInstance;

@end
