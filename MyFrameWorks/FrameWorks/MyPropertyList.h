//
//  MyPropertyList.h
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/8/24.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface MyPropertyList : NSObject

#pragma mark - Save Quotes Token Socket

+ (BOOL)writeSaveQuotesTokenSocketWithValue:(NSString *)quotesTokenSocket;

+ (NSString *)getSaveQuotesTokenSocketValue;

#pragma mark - SaveIdPass

+ (BOOL)writeSaveIdPassWithValue:(NSString *)userId Password:(NSString *)password;

+ (NSArray *)getSaveIdPassValue;

@end

