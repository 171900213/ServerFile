//
//  CZCell.m
//  异步下载网络图片
//
//  Created by 范承志 on 16/6/11.
//  Copyright © 2016年 fanchengzhi. All rights reserved.
//

#import "CZCell.h"
#import "CZModel.h"
#import "UIImageView+WebCache.h"

@interface CZCell ()

/**
 *  头像
 */
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;

/**
 *  名字
 */
@property (nonatomic, weak) IBOutlet UILabel *nameLable;

/**
 *  下载量
 */
@property (nonatomic, weak) IBOutlet UILabel *downLoadLable;
@end

@implementation CZCell


- (void)setModel:(CZModel *)model {
    
    _model = model;
    //给名字赋值
    self.nameLable.text = model.name;
    //给下载量赋值
    self.downLoadLable.text = model.download;
    //给头像赋值 并设置占位图
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"user_default"]];
    
}

@end
