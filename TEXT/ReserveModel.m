//
//  ReserveModel.m
//  TEXT
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ReserveModel.h"

@implementation ReserveModel
+ (ReserveModel *)shareReserveModel{
    static ReserveModel *model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[ReserveModel alloc] init];
        model.url = [[NSURL alloc] init];
    });
    
    
    return model;
    
}
@end
