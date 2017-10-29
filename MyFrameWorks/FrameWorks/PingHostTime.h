//
//  PingHostTime.h
//  PingHostLate
//
//  Created by Lycodes-MacBookPro15 on 2017/8/25.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PingHostTime : NSObject

- (void)pingHost:(NSString *)hostStr :(void(^)(void))completion;

@end
