//
//  ProgressView.h
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/3/22.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView

@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic, assign) CGFloat  progress;

- (instancetype)initWithFrame:(CGRect)frame;

@end
