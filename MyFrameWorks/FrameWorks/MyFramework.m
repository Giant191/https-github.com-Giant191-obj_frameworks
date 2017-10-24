//
//  MyFramework.m
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/2/22.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import "MyFramework.h"
#import "AppDelegate.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MyFramework

#pragma mark - Create Alert Controller Title

+ (void)createAlertControllerTitle:(NSString *)title alertMessage:(NSString *)alermessage CancelTitle:(NSString *)cancelTitle CreateViewController:(UIViewController *)createViewController {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:alermessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:cancelButton];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [createViewController presentViewController:alert animated:YES completion:nil];
        
    });
    
}

#pragma mark Get Image

+ (void)getImageWithURL:(NSString *)urlstring Completion:(void (^)(UIImage * _Nonnull))completion {
    
    NSURL *url = [NSURL URLWithString:urlstring];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location,NSURLResponse *response,NSError *error) {
        
        if (error == nil) {
            
            //解析Image
            NSData *data = [NSData dataWithContentsOfURL:location];
            
            UIImage *image = [UIImage imageWithData:data];
            
            completion(image);
            
        }
        
    }];
    
    [downloadTask resume];
    
}

#pragma mark - Get Json

+ (void)getJsonWithURL:(NSString *)urlstring Completion:(void (^)(NSArray * _Nonnull))completion {
    
    NSURL *url = [NSURL URLWithString:urlstring];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            
            completion(array);
            
        }
        
    }];
    
    [dataTask resume];
    
}

+ (void)postJsonWithURL:(NSString *)urlstring Value:(NSString *)value Completion:(void (^)(NSArray * _Nonnull))completion {
    
    NSURL *url = [NSURL URLWithString:urlstring];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // NSDictionary *parameters = @{@"data" : @"hello world"};
    //{"data" = "your message"}
    NSString *bodydata = [NSString stringWithFormat:@"%@", value];
    [request setHTTPMethod:@"POST"];
    NSData *req = [NSData dataWithBytes:[bodydata UTF8String] length:[bodydata length]];
    
    [request setHTTPBody:req];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
//            NSLog(@"%@", array);
            completion(array);
            
        }
        
    }];
    
    [dataTask resume];
    
}

+ (NSString *)md5:(NSString *)input {
    
    const char *cStr = [input UTF8String];
    
    unsigned char digest[16];
    
    CC_MD5( cStr, (unsigned int)strlen(cStr), digest ); // MD5調用
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

@end

@implementation CustomActivityIndicatorView

#pragma mark - Create Custom UIActivityIndicatorView

+ (instancetype)shareInstance {
    
    static CustomActivityIndicatorView *myCustomActivityIndicatorView = nil;
    static dispatch_once_t oncetoken;
    
    dispatch_once(&oncetoken, ^{
        
        myCustomActivityIndicatorView = [[CustomActivityIndicatorView alloc] init];
        
    });
    
    return myCustomActivityIndicatorView;
}

- (instancetype)init {
    
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    self = [super initWithFrame:rect];
    
    if (self) {
        
        self.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height /2);
        self.hidesWhenStopped = YES;
        self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        self.color = [UIColor whiteColor];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
    }
    
    return self;
}

#pragma mark - Start or Stop Action

- (void)start {
    
    [[AppDelegate shareDelegate].window addSubview:self];
    
    [self startAnimating];
    
}

- (void)stop {
    
    [self stopAnimating];
    
    [self removeFromSuperview];
    
}

@end

