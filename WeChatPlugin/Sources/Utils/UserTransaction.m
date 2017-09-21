//
//  UserTransaction.m
//  WeChatPlugin
//
//  Created by 魏希 on 2017/9/17.
//  Copyright © 2017年 tk. All rights reserved.
//

#import "UserTransaction.h"
#import "AFNetworking.h"

@interface UserTransaction()
@property (nonatomic,strong) AFHTTPSessionManager *afManager;
@end

@implementation UserTransaction

+ (instancetype)shareInstance{
    static UserTransaction *instance  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{instance = [[UserTransaction alloc]init];});
    return instance;
}

- (instancetype)init{
    if(self = [super init]){
        self.afManager = [AFHTTPSessionManager manager];
        self.afManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.afManager.requestSerializer.timeoutInterval = 15.0;
        self.afManager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.afManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        self.afManager.completionQueue = dispatch_queue_create("com.wish.completionQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}



@end
