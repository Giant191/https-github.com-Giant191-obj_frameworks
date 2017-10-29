//
//  SocketFrameWork.m
//  AsyncSocket191
//
//  Created by Lycodes-MacBookPro15 on 2017/3/15.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//


#import "SocketFrameWork.h"
#import "AppInformation.h"
#import "MyPropertyList.h"

#define HOST @""
#define PORT

@interface SocketFrameWork()

//@property void(^completion)(void);

@end

@implementation SocketFrameWork

#pragma mark - Share Instance

+ (instancetype)shareInstance {
    
    static SocketFrameWork *socketFrameWork = nil;
    static dispatch_once_t oncetoken;
    
    dispatch_once(&oncetoken, ^{
        
        socketFrameWork = [[SocketFrameWork alloc] init];
        
    });
    
    return socketFrameWork;
    
}

#pragma mark - Start Socket

- (void)startSocket:(NSDictionary *)nsDictionary {
    
//    _socket = [[GCDAsyncSocket alloc] initWithDelegate:self  delegateQueue:dispatch_get_main_queue()];
//
//    NSError * err = nil ;
//    [_socket connectToHost:HOST onPort:PORT error:&err];
//    if (err) {
//
//        NSLog(@"Start Socket err:%@", err);
//
//    }else {
//
//        [self dicionartToSocket:nsDictionary];
//
//    }
    
}

#pragma mark - Login Account

- (void)dicionartToSocket:(NSDictionary *)nsDictionary {
    
//    NSError *error;
//    NSData *valueData = [NSJSONSerialization dataWithJSONObject:nsDictionary options:NSJSONWritingPrettyPrinted error:&error];
//    if (error) {
//
//        NSLog(@"Error JSON-encoding object: %@", error);
//
//    }else {
//
////        NSString *valueString = [[NSString alloc] initWithData:valueData encoding:NSUTF8StringEncoding];
////        NSLog(@"JSON:\n%@", valueString);
//
//    }
//
//    unsigned int valueLengthInt = (int)[valueData length];
////    NSLog(@"%u", valueLengthInt);
//    Byte lengthByte[BIG_ENDIAN] = {0 & (0xFF), 0 & (0xFF), 0 & (0xFF), valueLengthInt & (0xFF)};
//    NSData *lengthData = [[NSData alloc] initWithBytes:lengthByte length:4];
//
//    [_socket writeData:lengthData withTimeout:-1 tag:1];
//
//    [_socket writeData:valueData withTimeout:-1 tag:2];
    
}

#pragma  mark - Socket Close

- (void)disconnect {
    
//    [_socket setDelegate:nil delegateQueue:NULL];
//    [_socket disconnect];
    
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - GCDAsyncSocket Delegate
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

//- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
//
//    NSLog(@"開口Connect!!!!");
//    Byte lengthByte[4];
//    [self.socket readDataToLength:sizeof(lengthByte) withTimeout:-1 tag:1];
//
//}
//
//- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
//
//    NSLog(@"開口連接失敗：%@", err);
//
//}
//
//- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
//
//    NSLog(@"%ld", tag);
//
//    switch (tag) {
//        case 1:
//            break;
//        case 2:
//            NSLog(@"First request sent");
//            break;
//        default:
//            break;
//    }
//
//}
//
//- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
//
//    NSArray *stringArray;
//    NSError *error;
//    int value;
//    Byte lengthByte[4];
//
////    NSLog(@"Tag:%ld", tag);
//
//    switch (tag) {
//        case 1:
//            value = CFSwapInt32BigToHost(*(int*)([data bytes]));
//            NSLog(@"SokcetLong:%d", value);
//            [self.socket readDataToLength:value withTimeout:-1 tag:2];
//            break;
//        case 2:
//            stringArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
////            NSLog(@"stringArray%@", stringArray);
//            _symbolArray = [stringArray valueForKey:@"k"];
//
//            [self.socket readDataToLength:sizeof(lengthByte) withTimeout:-1 tag:1];
//            break;
//        default:
//            break;
//    }
//
//}

@end
