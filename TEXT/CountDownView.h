//
//  CountDownView.h
//  TEXT
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountDownView : UIView
@property (nonatomic, strong)UILabel *dateL;

- (instancetype)initWithFrame:(CGRect)frame endTime:(NSDate *)date textColor:(UIColor *)textcolor backgroudcolor:(UIColor *)backgroudcolor height:(CGFloat)height widht:(CGFloat)widht font:(UIFont *)font;
@end
