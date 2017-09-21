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

- (void)request:(NSString*)urlString withParams:(NSDictionary *)params withMethod:(RequestMethod) method withBlock:(NetworkBlock)block{
    if(method == RequestMethodGET){
        [self.afManager GET:urlString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            block(responseObject,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            block(nil,error);
        }];
    }else if(method == RequestMethodPOST){
        [self.afManager POST:urlString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            block(responseObject,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            block(nil,error);
        }];
    }
    
}

- (void)requestCreateRoomWithBlock:(NetworkBlock)block {
    NSString *fullPath = @"http://120.25.2.235:8880/botcreate?userid=100008&gamemode=0";
    [self request:fullPath withParams:nil withMethod:RequestMethodGET withBlock:^(id data, NSError *error) {
        if(error){
            error = [NSError errorWithDomain:@"网络异常" code:-9999 userInfo:nil];
            block(nil,error);
        }else{
            NSArray *array = (NSArray*)data;
            NSDictionary *dict = array[1];
            NSString *id_ = [dict objectForKey:@"id"];
            block(id_, nil);
            
        }
    }];
}



@end
