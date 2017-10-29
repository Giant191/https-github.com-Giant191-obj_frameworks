//
//  PingHostTime.m
//  PingHostLate
//
//  Created by Lycodes-MacBookPro15 on 2017/8/25.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import "PingHostTime.h"
#import "GBPing.h"
#import "AppDelegate.h"

@interface PingHostTime () <GBPingDelegate>

@property void(^completion)(void);

@property (nonatomic, strong)GBPing *myPing;
@property (nonatomic, strong)NSTimer *timer;

@end

@implementation PingHostTime

- (void)pingHost:(NSString *)hostStr :(void(^)(void))completion {
    
    _completion = completion;
    
    self.myPing = [[GBPing alloc ] init ];
    self.myPing.host = hostStr;
    self.myPing.delegate = self;
    self.myPing.timeout = 1.0 ;
    self.myPing.pingPeriod = 0.9 ;
    
    [self.myPing setupWithBlock:^(BOOL success, NSError *error) { //necessary to resolve hostname
        if (success) {
            //start pinging
            [self.myPing startPinging];
            
        }
        else {
            NSLog(@"failed to start");
        }
        
    }];
    
}

- (void)stopPing:(GBPingSummary *)summary {
    
//    [AppDelegate shareDelegate].pingTimeStr = [NSString stringWithFormat:@"%f", summary.rtt];
    
    NSLog(@"stop it");
    [self.myPing stop];
    self.myPing = nil;
    [_timer invalidate];
    _completion();
    
}

- (void)failPing:(NSError *)error {
    
//    [AppDelegate shareDelegate].pingTimeStr = [NSString stringWithFormat:@"0"];
    
    NSLog(@"stop it");
    [self.myPing stop];
    self.myPing = nil;
    [_timer invalidate];
    _completion();
    
}

-(void)ping:(GBPing *)pinger didReceiveReplyWithSummary:(GBPingSummary *)summary {
    NSLog(@"REPLY>  %@", summary);
    [self stopPing:summary];
}

-(void)ping:(GBPing *)pinger didReceiveUnexpectedReplyWithSummary:(GBPingSummary *)summary {
    NSLog(@"BREPLY> %@", summary);
}

-(void)ping:(GBPing *)pinger didSendPingWithSummary:(GBPingSummary *)summary {
    NSLog(@"SENT>   %@", summary);
}

-(void)ping:(GBPing *)pinger didTimeoutWithSummary:(GBPingSummary *)summary {
    NSLog(@"TIMOUT> %@", summary);
    [self stopPing:summary];
}

-(void)ping:(GBPing *)pinger didFailWithError:(NSError *)error {
    NSLog(@"FAIL>   %@", error);
    [self failPing:error];
}

-(void)ping:(GBPing *)pinger didFailToSendPingWithSummary:(GBPingSummary *)summary error:(NSError *)error {
    NSLog(@"FSENT>  %@, %@", summary, error);
    [self stopPing:summary];
}


@end
