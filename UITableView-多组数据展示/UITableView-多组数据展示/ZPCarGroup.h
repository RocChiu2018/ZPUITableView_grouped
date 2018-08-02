//
//  ZPCarGroup.h
//  UITableView-多组数据展示
//
//  Created by apple on 16/5/14.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 UITableView每个section的模型
 */
#import <Foundation/Foundation.h>

@interface ZPCarGroup : NSObject

@property (nonatomic, strong) NSString *header;  //每个分区的头部标题
@property (nonatomic, strong) NSString *footer;  //每个分区的尾部标题
@property (nonatomic, strong) NSArray *cars;  //这个数组里面存放的是ZPCar模型

@end
