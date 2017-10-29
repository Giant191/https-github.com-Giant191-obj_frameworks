//
//  AppInformation.m
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/8/25.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import "AppInformation.h"

@implementation AppInformation

+ (instancetype)shareInstance {
    
    static AppInformation *myAppInformation = nil;
    static dispatch_once_t oncetoken;
    
    dispatch_once(&oncetoken, ^{
        
        myAppInformation = [[AppInformation alloc]init];
        
    });
    
    return myAppInformation;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
    
        _aa = @"";
        
    }
    
    return self;
}

@end
