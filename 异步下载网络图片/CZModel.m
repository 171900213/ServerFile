//
//  CZModel.m
//  异步下载网络图片
//
//  Created by 范承志 on 16/6/11.
//  Copyright © 2016年 fanchengzhi. All rights reserved.
//

#import "CZModel.h"

@implementation CZModel

+ (instancetype)appWithDict:(NSDictionary *)dict {
    
    CZModel *model = [[CZModel alloc] init];
    
    //KVC
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (NSString *)description {
    
    
    return [NSString stringWithFormat:@"%@ - %@ - %@",self.name,self.icon,self.download];
}

@end
