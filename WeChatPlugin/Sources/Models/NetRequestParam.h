//
//  NetRequestParam.h
//  WeChatPlugin
//
//  Created by 魏希 on 2017/9/21.
//  Copyright © 2017年 tk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSURLSessionDataTask;

@interface NetRequestParam : NSObject
@property(nonatomic,strong) NSString *method;
@property(nonatomic,strong) NSString *requestUrl;
@property(nonatomic,assign) BOOL json;
@property(nonatomic,strong) NSDictionary *urlParam;
@property(nonatomic,strong) id userInfo;
@property(nonatomic,strong) NSString *notyName;
@property(nonatomic,weak) NSURLSessionDataTask *task;

@property(nonatomic,strong) id data;
@property(nonatomic,strong) NSString *message;
@property(nonatomic,assign) int code;
@end
