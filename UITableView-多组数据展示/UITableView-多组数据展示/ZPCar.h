//
//  ZPCar.h
//  UITableView-多组数据展示
//
//  Created by apple on 16/5/14.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 UITableView每个cell的模型
 */
#import <Foundation/Foundation.h>

@interface ZPCar : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;

+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon;

@end
