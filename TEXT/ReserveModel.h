//
//  ReserveModel.h
//  TEXT
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReserveModel : NSObject
@property (nonatomic, strong)NSURL *url;

+ (ReserveModel *)shareReserveModel;
@end
