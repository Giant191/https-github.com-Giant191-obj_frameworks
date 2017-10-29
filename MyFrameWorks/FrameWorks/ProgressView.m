//
//  ProgressView.m
//  ToopTions
//
//  Created by Lycodes-MacBookPro15 on 2017/3/22.
//  Copyright © 2017年 Lycodes-MacBookPro15. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView ()

{
    CALayer   *_backLayer;
    CGFloat    _frameWidth;
    CGFloat    _layerWidth;
}

@end

@implementation ProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _backLayer       = [CALayer layer];
        
        _frameWidth      = self.bounds.size.width;
        _layerWidth      = 0;
        
        _backLayer.frame = CGRectMake(0, 0, _layerWidth, frame.size.height);
        [self.layer addSublayer:_backLayer];
    }
    return self;
}

@synthesize progressColor = _progressColor;

- (void)setProgressColor:(UIColor *)progressColor {
    _progressColor             = progressColor;
    _backLayer.backgroundColor = _progressColor.CGColor;
}

- (UIColor *)progressColor {
    return _progressColor;
}

@synthesize progress = _progress;

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    CGRect rect = _backLayer.frame;
    if (_progress <= 0) {
        rect.size.width = 0;
    } else if (_progress >= 1) {
        rect.size.width = _frameWidth;
    } else {
        rect.size.width = _progress * _frameWidth;
    }
    
    _backLayer.frame = rect;
}

- (CGFloat)progress {
    return _progress;
}


@end
