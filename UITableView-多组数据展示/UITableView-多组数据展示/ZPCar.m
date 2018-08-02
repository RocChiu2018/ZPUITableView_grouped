//
//  ZPCar.m
//  UITableView-多组数据展示
//
//  Created by apple on 16/5/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPCar.h"

@implementation ZPCar

+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon
{
    ZPCar *car = [[self alloc] init];
    car.name = name;
    car.icon = icon;
    
    return car;
}

@end
