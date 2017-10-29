//
//  ClientThrift.m
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/6/21.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import "ClientThrift.h"
//#import "FOREX.h"
//#import <Thrift/TSocketClient.h>
//#import <Thrift/TCompactProtocol.h>
//#import <thrift/TFramedTransport.h>
#import "MyPropertyList.h"

#define HOST @""
#define PORT

@interface ClientThrift()

@property void(^completion)(void);
@property void(^completion1)(void);
@property void(^completion2)(void);
@property (nonatomic, strong)NSUserDefaults *userDefaultes;

@end

@implementation ClientThrift

#pragma mark - Share Instance

+ (instancetype)shareInstance {
    
    static ClientThrift *clientThrift = nil;
    static dispatch_once_t oncetoken;
    
    dispatch_once(&oncetoken, ^{
        
        clientThrift = [[ClientThrift alloc] init];
        
    });
    
    return clientThrift;
}

//- (void)loginThrift:(int32_t)login Password:(NSString *)password time:(double)time :(void(^)(void))completion {
//
//    TSocketClient *scoket = [[TSocketClient alloc] initWithHostname:self.hostStr port:PORT];
//    TFramedTransport *transport = [[TFramedTransport alloc] initWithTransport:scoket];
//    TCompactProtocol *protocol = [[TCompactProtocol alloc] initWithTransport:transport ];
//
//    if (protocol) {
//        FOREXAPIClient *client = [[FOREXAPIClient alloc] initWithProtocol:protocol];
//        if (client) {
//
//            self.userLoginInt = [client UserLogin:login password:password time:time];
//
//            completion();
//        }
//
//    }
//
//}


@end
