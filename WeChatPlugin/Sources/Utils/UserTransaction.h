//
//  UserTransaction.h
//  WeChatPlugin
//
//  Created by 魏希 on 2017/9/17.
//  Copyright © 2017年 tk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetDefine.h"

@interface UserTransaction : NSObject

+ (instancetype)shareInstance;

- (void)requestCreateRoomWithBlock:(NetworkBlock)block;

@end
