//
//  CZModel.h
//  异步下载网络图片
//
//  Created by 范承志 on 16/6/11.
//  Copyright © 2016年 fanchengzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZModel : NSObject

/**
 *  名字
 */
@property (nonatomic, copy) NSString *name;
/**
 *  头像
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  下载量
 */
@property (nonatomic, copy) NSString *download;

//字典转模型
+ (instancetype)appWithDict:(NSDictionary *)dict;
@end
