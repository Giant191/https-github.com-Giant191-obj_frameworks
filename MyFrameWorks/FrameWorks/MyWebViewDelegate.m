//
//  MyWebViewDelegate.m
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/3/2.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import "MyWebViewDelegate.h"

@implementation MyWebViewDelegate

#pragma mark - Share Instance

+ (instancetype)shareInstance {
    
    static MyWebViewDelegate *mywebviewdelegate = nil;
    static dispatch_once_t oncetoken;
    
    dispatch_once(&oncetoken, ^{
        
        mywebviewdelegate = [[MyWebViewDelegate alloc]init];
        
    });
    
    return mywebviewdelegate;
}

@end
