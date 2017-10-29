//
//  ClientThrift.h
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/6/21.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClientThrift : NSObject

@property (nonatomic) int32_t userLoginInt;
@property (nonatomic, strong) NSString *hostStr, *pingHostLateStr;
@property (nonatomic, strong) NSArray *getAllDcArray, *symbolArray;
@property (nonatomic, strong) NSMutableArray *tradesGetByOrdersArray;
@property (nonatomic) int makreExecution;

+ (instancetype)shareInstance;
//- (void)loginThrift:(int32_t)login Password:(NSString *)password time:(double)time :(void(^)(void))completion;


@end
