//
//  ExchangeRedis_login.m
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/9/4.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import "ExchangeRedis_login.h"
#import "CocoaRedis.h"
#import "AppDelegate.h"
#import "ClientThrift.h"

#define POST 1

@implementation ExchangeRedis_login

#pragma mark - Share Instance

+ (instancetype)shareInstance {
    
    static ExchangeRedis_login *exchangeRedis_login = nil;
    static dispatch_once_t oncetoken;
    
    dispatch_once(&oncetoken, ^{
        
        exchangeRedis_login = [[ExchangeRedis_login alloc] init];
        
    });
    
    return exchangeRedis_login;
    
}

#pragma mark - Start Get Data

- (void)startGetDataCompletion:(NSString *)userID {
    
    ClientThrift *clientHost = [ClientThrift shareInstance];
    NSString *HOST = [NSString stringWithFormat:@"%@", clientHost.hostStr];
    
    CocoaRedis *redis = [[CocoaRedis alloc] init];
    
    [[[[[[[redis connectWithHost:HOST port:POST] then:^id(id value) {
        return [redis auth:[NSString stringWithFormat:@"f"]];
    }] then:^id(id value) {
        return [redis select:0];
    }] then:^id(id value) {
//        return [redis hmset:userID values:pingLate];
        return nil;
    }] then:^id(id value) {
        NSString *loginStr = [NSString stringWithFormat:@"%@", userID];
        return [redis subscribe:loginStr];
    }] then:^id(id value) {
        // Add out observer to notification center
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserverForName: CocoaRedisMessageNotification
                            object: nil
                             queue: nil
                        usingBlock: ^(NSNotification *notification)
         {
             // Get published message from the notification object.
             NSString *message = notification.userInfo[@"message"];
             NSArray *array = [message componentsSeparatedByString:@","];
             if ([array[0] isEqualToString:userID]) {
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"redis_login" object:message];
             }
         }];
        return nil;
    }] catch:^id(NSError *err) {
        NSLog(@"Error: %@", err);
        
        return nil;
    }];
    
}

@end
