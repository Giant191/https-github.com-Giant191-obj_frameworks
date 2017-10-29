//
//  CheckNetworkandController.m
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/3/3.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import "CheckNetworkandController.h"
#import "MyFramework.h"
#import "AESCrypt.h"

@interface CheckNetworkandController ()

@end

@implementation CheckNetworkandController {
    
    Reachability *reachabilty;
    TabBarController *TBC;
    
    NSString *getKey;
    
}

#pragma mark -  View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor colorWithRed:(38 / 255.0) green:(41 / 255.0) blue:(48 / 255.0) alpha:1];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self networkNotification];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event response

- (void)networkNotification {
    
    //  Register notification for Network status change
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    //    //  Initialize the listener for network status
    //
    reachabilty = [Reachability reachabilityForInternetConnection];
    [reachabilty startNotifier];
    [self updateInterfaceWithReachability: reachabilty];
    
}

// Called by Reachability whenever status changes.
- (void)reachabilityChanged:(NSNotification *)note {
    
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    [self updateInterfaceWithReachability: curReach];

}

//  Implementation for Network status notification
- (void)updateInterfaceWithReachability:(Reachability *)curReach {
    
    NetworkStatus curStatus;
    
    BOOL m_bReachableViaWWAN;
    BOOL m_bReachableViaWifi;
    BOOL m_bReachable;
    //  According to curReach, modify current internal flags
    
    //  Internet reachability
    //  Need network status to know real reachability method
    curStatus = [curReach currentReachabilityStatus];
    
    //  Modify current network status flags
    if (curStatus == ReachableViaWWAN) {
        m_bReachableViaWWAN = true;
    } else {
        m_bReachableViaWWAN = false;
    }
    
    if (curStatus == ReachableViaWiFi) {
        m_bReachableViaWifi = true;
        
    } else {
        m_bReachableViaWifi = false;
    }
    
    //  Reachable is the OR result of two internal connection flags
    m_bReachable = (m_bReachableViaWifi || m_bReachableViaWWAN);
    if (!m_bReachable) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注意" message:@"无法连结网路" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *yesButton = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            exit(0);
        }];
        
        [alert addAction:yesButton];
        
        UIViewController *topVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        while (topVC.presentedViewController)
        {
            topVC = topVC.presentedViewController;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [topVC presentViewController:alert animated:YES completion:nil];
        });
        
    }else {
        
        [self performSelector:@selector(ChangePage) withObject:nil afterDelay:0.0];
        
    }
    
}

- (void)ChangePage {
    
    TBC = [[TabBarController alloc] init];
    [self showDetailViewController:TBC sender:self];
    
}

- (void)deKeyAndSave {
    
    NSString *message = [NSString stringWithFormat:@"%@", getKey];
    NSString *password = @"lycodes";
    
    NSString *publicKey = [AESCrypt decrypt:message password:password];
//    NSLog(@"%@", publicKey);
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:publicKey forKey:@"publicKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


@end

