//
//  TabBarController.m
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/2/14.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "MyFramework.h"
#import "AppDelegate.h"

@interface TabBarController ()

@end

@implementation TabBarController {
    
    UINavigationController *myNavigation;
    NSMutableArray *navigationView;
    NSUserDefaults *userDefaultes;
    
    CustomActivityIndicatorView *myCustomActivityIndicatorView;
    
}

#pragma mark -  View Life Cycle

- (void)loadView {
    [super loadView];
    
    myCustomActivityIndicatorView = [CustomActivityIndicatorView shareInstance];
    
    userDefaultes = [NSUserDefaults standardUserDefaults];
    if ([[userDefaultes valueForKey:@"LoIn"] isEqualToString:@"YES"]) {
        
        
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [myCustomActivityIndicatorView stop];
    
    navigationView = [[NSMutableArray alloc] init];
    
//    myShareViewController = [[ShareViewController alloc] init];
//    myNavigation = [NavigationController ViewController:myShareViewController TabBarTitle:nil TabBarImage:[UIImage imageNamed:@"invite"] SelectTabBarImage:[UIImage imageNamed:@"invite_current"]];
//
//    [navigationView addObject:myNavigation];
//
//
//    myQuotesPageViewController = [[QuotesPageViewController alloc] init];
//    myNavigation = [NavigationController ViewController:myQuotesPageViewController TabBarTitle:nil TabBarImage:[UIImage imageNamed:@"transaction"] SelectTabBarImage:[UIImage imageNamed:@"transaction_current"]];
//
//    [navigationView addObject:myNavigation];
    
    self.viewControllers = navigationView;
    
    self.tabBar.translucent  = NO;
    
    self.tabBar.barTintColor = [UIColor colorWithRed:(255.0f/255) green:(255.0f/255.0f) blue:(255.0f/255.0f) alpha:1];
    
    self.delegate = self;
    
    self.selectedIndex = 3;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectFriendButtonAction) name:@"SelectFriendButtonAction" object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event response

//變更tabbar高度
//- (void)viewWillLayoutSubviews {
//    
//    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
//    tabFrame.size.height = 40;
//    tabFrame.origin.y = self.view.frame.size.height - 40;
//    self.tabBar.frame = tabFrame;
//    
//}

- (void)selectFriendButtonAction {
    
    self.selectedIndex = 0;
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    if ([viewController isEqual:[navigationView objectAtIndex:0]]) {
    
    
    }

    if ([viewController isEqual:[navigationView objectAtIndex:1]]) {
        
        
    }
    
    if ([viewController isEqual:[navigationView objectAtIndex:2]]) {
        
        
        
    }
    
    if ([viewController isEqual:[navigationView objectAtIndex:3]]) {
        
        
    }

}

#pragma mark - getters and setters


@end
