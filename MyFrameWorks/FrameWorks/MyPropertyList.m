//
//  MyPropertyList.m
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/8/24.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//


#import "MyPropertyList.h"

@implementation MyPropertyList

#pragma mark - Save Quotes Token Socket

+ (BOOL)writeSaveQuotesTokenSocketWithValue:(NSString *)quotesTokenSocket {
    
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/SaveQuotesTokenSocket.plist"];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setValue:quotesTokenSocket forKey:@"QuotesToken"];
    if ([dictionary writeToFile:path atomically:YES]) {
        return YES;
    }else {
        return NO;
    }
    
}

+ (NSString *)getSaveQuotesTokenSocketValue {
    
    NSString *quotesTokenSocket;
    
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/SaveQuotesTokenSocket.plist"];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    quotesTokenSocket = [dictionary valueForKey:@"QuotesToken"];
    
    return quotesTokenSocket;
}

#pragma mark - SaveIdPass

+ (BOOL)writeSaveIdPassWithValue:(NSString *)userId Password:(NSString *)password {

    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/SaveIdPass.plist"];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setValue:userId forKey:@"UserId"];
    [dictionary setValue:password forKey:@"Password"];
    if ([dictionary writeToFile:path atomically:YES]) {
        return YES;
    }else {
        return NO;
    }
    
}

+ (NSArray *)getSaveIdPassValue {
    
    NSString *userIdStr, *passwordStr;
    
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/SaveIdPass.plist"];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    userIdStr = [dictionary valueForKey:@"UserId"];
    passwordStr = [dictionary valueForKey:@"Password"];

    NSArray *saveIdPassArray = [[NSArray alloc] initWithObjects:userIdStr, passwordStr, nil];
    
    return saveIdPassArray;
}

@end


