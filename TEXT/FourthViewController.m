//
//  FourthViewController.m
//  TEXT
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FourthViewController.h"
#import "CountDownView.h"
@interface FourthViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textF;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSTimeInterval tme = [[NSDate date] timeIntervalSince1970];
    self.textF.delegate = self;
    NSLog(@"%f",tme);
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:3600];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 260, 50)];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
    label.text = @"8点20开抢";
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    
    CountDownView *view= [[CountDownView alloc] initWithFrame:CGRectMake(50, 200, 200, 30) endTime:date textColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8] backgroudcolor:[UIColor whiteColor] height:25 widht:25 font:[UIFont systemFontOfSize:14]];
    [self.view addSubview:view];
    
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    if ([textField.text integerValue] > 10) {
        NSLog(@"----------------");
    }
    
    
    return YES;
}




- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *str = [NSString stringWithFormat:@"%@%@",textField.text,string];
    
    
    if ([str integerValue] > 10) {
//        NSLog(@"----------------");
    }
    
    
    return YES;
}


//- (BOOL)textFieldShouldClear:(UITextField *)textField{
//            if ([textField.text integerValue] > 10) {
//            NSLog(@"----------------");
//        }
//        
//        
//        return YES;
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
