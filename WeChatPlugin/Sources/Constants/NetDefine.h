//
//  NetDefine.h
//  WeChatPlugin
//
//  Created by 魏希 on 2017/9/21.
//  Copyright © 2017年 tk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RequestMethod) {
    RequestMethodGET = 0,
    RequestMethodPOST = 1
};

typedef void(^NetworkBlock)(id data, NSError *error);

@interface NetDefine : NSObject

@end
