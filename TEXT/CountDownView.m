//
//  CountDownView.m
//  TEXT
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CountDownView.h"

@interface CountDownView ()
{
    dispatch_source_t _timer;
}
//@property (strong, nonatomic) UILabel *dayLabel;
@property (strong, nonatomic) UILabel *hourLabel;
@property (strong, nonatomic) UILabel *minuteLabel;
@property (strong, nonatomic) UILabel *secondLabel;
@end

@implementation CountDownView

- (instancetype)initWithFrame:(CGRect)frame endTime:(NSDate *)date textColor:(UIColor *)textcolor backgroudcolor:(UIColor *)backgroudcolor height:(CGFloat)height widht:(CGFloat)widht font:(UIFont *)font{
    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = 0.8;
//        self.dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 30, 25)];
//        self.dayLabel.textColor = [UIColor whiteColor];
//        self.dayLabel.backgroundColor = [UIColor blackColor];
//        self.dayLabel.textAlignment = NSTextAlignmentCenter;
//        self.dayLabel.font = [UIFont systemFontOfSize:14];
//        [self addSubview:self.dayLabel];
        
        self.hourLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, widht, height)];
        self.hourLabel.textColor = textcolor;
        self.hourLabel.backgroundColor = backgroudcolor;
        self.hourLabel.layer.masksToBounds = YES;
        self.hourLabel.layer.borderWidth = 1;
        self.hourLabel.layer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2].CGColor;
        self.hourLabel.font = font;
        self.hourLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.hourLabel];
        
        UILabel *colonL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.hourLabel.frame), 0, 12, height)];
        colonL.textAlignment = NSTextAlignmentCenter;
        colonL.text = @":";
        colonL.textColor = textcolor;
//        colonL.backgroundColor = [UIColor whiteColor];
        colonL.font = font;
        [self addSubview:colonL];
        self.minuteLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(colonL.frame), 0, widht, height)];
        self.minuteLabel.textAlignment = NSTextAlignmentCenter;
        self.minuteLabel.textColor = textcolor;
        self.minuteLabel.backgroundColor = backgroudcolor;
        self.minuteLabel.font = font;
        self.minuteLabel.layer.masksToBounds= YES;
        self.minuteLabel.layer.borderWidth = 1;
        self.minuteLabel.layer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2].CGColor;
        [self addSubview:self.minuteLabel];
        
        UILabel *colonL1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.minuteLabel.frame), 0, 12, height)];
        colonL1.textAlignment = NSTextAlignmentCenter;
        colonL1.text = @":";
        colonL1.textColor = textcolor;
        //        colonL.backgroundColor = [UIColor whiteColor];
        colonL1.font = font;
        [self addSubview:colonL1];
        
        self.secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(colonL1.frame), 0, widht, height)];
        self.secondLabel.textAlignment = NSTextAlignmentCenter;
        self.secondLabel.textColor = textcolor;
        self.secondLabel.backgroundColor = backgroudcolor;
        self.secondLabel.font = font;
        self.secondLabel.layer.masksToBounds = YES;
        self.secondLabel.layer.borderWidth = 1;
        self.secondLabel.layer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2].CGColor;
        [self addSubview:self.secondLabel];
        
        
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        
//        NSDate *endDate = date;
//        NSDate *endDate_tomorrow = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([endDate timeIntervalSinceReferenceDate] + 24*3600)];
        NSDate *startDate = [NSDate date];
        
        NSTimeInterval timeInterval =[date timeIntervalSinceDate:startDate];
        
        if (_timer==nil) {
            __block int timeout = timeInterval; //倒计时时间
            
            if (timeout!=0) {
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
                dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
                dispatch_source_set_event_handler(_timer, ^{
                    if(timeout<=0){ //倒计时结束，关闭
                        dispatch_source_cancel(_timer);
                        _timer = nil;
                        dispatch_async(dispatch_get_main_queue(), ^{
//                            self.dayLabel.text = @"";
                            self.hourLabel.text = @"00";
                            self.minuteLabel.text = @"00";
                            self.secondLabel.text = @"00";
                        });
                    }else{
                        int days = (int)(timeout/(3600*24));
                        int hours = (int)((timeout-days*24*3600)/3600);
                        int minute = (int)(timeout-days*24*3600-hours*3600)/60;
                        int second = timeout-days*24*3600-hours*3600-minute*60;
                        if (days==0) {
                            //                                self.dayLabel.text = @"0天";
                        }else{
                            //                                self.dayLabel.text = [NSString stringWithFormat:@"%d天",days];
                            hours = hours+days*24;
                        }
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            if (hours<10) {
                                self.hourLabel.text = [NSString stringWithFormat:@"0%d",hours];
                            }else{
                                self.hourLabel.text = [NSString stringWithFormat:@"%d",hours];
                            }
                            if (minute<10) {
                                self.minuteLabel.text = [NSString stringWithFormat:@"0%d",minute];
                            }else{
                                self.minuteLabel.text = [NSString stringWithFormat:@"%d",minute];
                            }
                            if (second<10) {
                                self.secondLabel.text = [NSString stringWithFormat:@"0%d",second];
                            }else{
                                self.secondLabel.text = [NSString stringWithFormat:@"%d",second];
                            }
                            
                        });
                        timeout--;
                    }
                });
                dispatch_resume(_timer);
            }
        }
        
        

        
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
