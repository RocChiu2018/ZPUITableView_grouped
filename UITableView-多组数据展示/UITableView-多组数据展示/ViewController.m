//
//  ViewController.m
//  UITableView-多组数据展示
//
//  Created by apple on 16/5/13.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 UITableView控件分为两种样式：普通样式(Plain)和分组样式(Grouped)；
 在Plain样式下，滚动UITableView控件的时候，它的Header不随控件的滚动而滚动，而在Grouped样式下，滚动UITableView控件的时候，它的每个section的Header和Footer是随着控件的滚动而滚动的。
 在xib文件中已经把UITableView控件选为了分组样式(Grouped)样式。
 */
#import "ViewController.h"
#import "ZPCar.h"
#import "ZPCarGroup.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *groups;

@end

@implementation ViewController

#pragma mark ————— 懒加载 —————
-(NSArray *)groups
{
    if (_groups == nil)
    {
        //封装德系车的ZPCarGroup对象
        ZPCarGroup *carGroup0 = [[ZPCarGroup alloc] init];
        carGroup0.header = @"德系";
        carGroup0.footer = @"德国的汽车";
        
        ZPCar *car1 = [ZPCar carWithName:@"奥迪" icon:@"m_2_100"];
        ZPCar *car2 = [ZPCar carWithName:@"宝马" icon:@"m_3_100"];
        ZPCar *car3 = [ZPCar carWithName:@"奔驰" icon:@"m_5_100"];
        
        carGroup0.cars = [NSArray arrayWithObjects:car1, car2, car3, nil];
        
        //封装日系车的ZPCarGroup对象
        ZPCarGroup *carGroup1 = [[ZPCarGroup alloc] init];
        carGroup1.header = @"日系";
        carGroup1.footer = @"日本的汽车";
        
        ZPCar *car4 = [ZPCar carWithName:@"奥迪1" icon:@"m_9_100"];
        ZPCar *car5 = [ZPCar carWithName:@"宝马1" icon:@"m_8_100"];
        ZPCar *car6 = [ZPCar carWithName:@"奔驰1" icon:@"m_6_100"];
        
        carGroup1.cars = [NSArray arrayWithObjects:car4, car5, car6, nil];
        
        _groups = [NSArray arrayWithObjects:carGroup0, carGroup1, nil];
    }
    
    return _groups;
}

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark ————— UITableViewDataSource —————
/**
 UITableView一共有几个分区
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

/**
 UITableView每个分区有几行
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ZPCarGroup *group = [self.groups objectAtIndex:section];
    
    return group.cars.count;
}

/**
 UITableView每个cell是什么样子的
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    ZPCarGroup *group = [self.groups objectAtIndex:indexPath.section];
    ZPCar *car = [group.cars objectAtIndex:indexPath.row];
    
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

/**
 每个分区的头部标题
 */
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ZPCarGroup *group = [self.groups objectAtIndex:section];
    
    return group.header;
}

/**
 每个分区的尾部标题
 */
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ZPCarGroup *group = [self.groups objectAtIndex:section];
    
    return group.footer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
