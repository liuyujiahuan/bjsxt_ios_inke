//
//  SXTHotLiveHandler.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/22.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTHotLiveHandler.h"
#import "HttpTool.h"
#import "MJExtension.h"
#import "SXTLive.h"
#import "SXTAdvertise.h"

@implementation SXTHotLiveHandler

+ (void)executeGetAdvertiseWithSuccess:(SuccessBlock)success
                                failed:(FailedBlock)failed {
    
    [HttpTool getWithPath:API_Advertise params:nil success:^(id json) {
        
        NSDictionary * resources = json[@"resources"][0];
        SXTAdvertise * ad = [SXTAdvertise mj_objectWithKeyValues:resources];
        success(ad);

    } failure:^(NSError *error) {
        
    }];
}

+ (void)executeGetHotLiveTaskWithPage:(NSInteger)pageNum
                              success:(SuccessBlock)success
                               failed:(FailedBlock)failed {
    
    [HttpTool getWithPath:API_LiveGetTop params:nil success:^(id json) {
        
        NSInteger error = [json[@"dm_error"] integerValue];
        if (!error) {
            
            NSArray * lives = [SXTLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(lives);
            
        } else {
            
            failed(json);
            
        }
    } failure:^(NSError *error) {
        
        failed(error);
    }];
    
}

+ (void)executeNearLiveTaskWithSuccess:(SuccessBlock)success
                                failed:(FailedBlock)failed {
    
    NSDictionary * params = @{@"uid":@"85149891",
                              @"latitude":@"40.090562",
                              @"longitude":@"116.413353"
                              };
    
    [HttpTool getWithPath:API_NearLocation params:params success:^(id json) {
        
        NSInteger error = [json[@"dm_error"] integerValue];
        
        if (!error) {
            
            NSArray * lives = [SXTLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
                        
            success(lives);
            
        } else {
            
            failed(json);
            
        }
    } failure:^(NSError *error) {
        
        failed(error);
    }];
}

@end
