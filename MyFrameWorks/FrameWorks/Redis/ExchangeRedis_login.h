//
//  ExchangeRedis_login.h
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/9/4.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExchangeRedis_login : NSObject

+ (instancetype)shareInstance;

- (void)startGetDataCompletion:(NSString *)userID;

@end
