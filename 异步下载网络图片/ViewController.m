//
//  ViewController.m
//  异步下载网络图片
//
//  Created by 范承志 on 16/6/11.
//  Copyright © 2016年 fanchengzhi. All rights reserved.
// https://raw.githubusercontent.com/171900213/ServerFile/master/apps.json

#import "ViewController.h"
#import "AFNetworking.h"
#import "CZModel.h"
#import "CZCell.h"
#import "YYModel.h"

@interface ViewController ()

/**
 *  用来存储所有模型数据的数组
 */
@property (nonatomic, strong) NSArray *appList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载JOSN数据
    [self loadJSONData];
    
}

#pragma mark - 实现数据源方法
//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.appList.count;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CZCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appCell" forIndexPath:indexPath];
    
    //获取cell对应的模型数据
    CZModel *model = self.appList[indexPath.row];
    
    cell.model = model;
    
    return cell;
}

#pragma mark - 加载JOSN数据
- (void)loadJSONData {
    
    //创建网络请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //发送请求
    [manager GET:@"https://raw.githubusercontent.com/171900213/ServerFile/master/apps.json" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray * responseObject) {
        
        //创建临时存储模型数据的数组
        NSMutableArray *tempM = [NSMutableArray array];
        //遍历数据
        [responseObject enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            //字典转模型
            CZModel *model = [CZModel appWithDict:obj];
            
            //模型数据添加临时数组中
            [tempM addObject:model];
            
        }];
        
        //给模型数组赋值
        self.appList = tempM.copy;
        
        //刷新列表
        [self.tableView reloadData];

        //自定义cell
    
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        NSLog(@"请求失败显示失败信息%@",error);
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
