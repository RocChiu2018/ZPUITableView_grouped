//
//  ViewController.m
//  UITableView-多组数据展示
//
//  Created by apple on 16/5/13.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 可以通过如下的三种方式完成列表样式：
 1、在xib文件中添加UITableView控件；
 2、在代码中创建UITableView控件；
 3、使用UITableViewController作为视图控制器（自带UITableView控件）。
 
 UITableView控件分为两种样式：普通样式(Plain)和分组样式(Grouped)。这两种样式的UITableView控件都拥有列表的头部视图(tableHeaderView)和列表的尾部视图(tableFooterView)属性，可以通过这两个属性设置UITableView控件的头部视图和尾部视图。除此之外，这两种样式的列表都可以拥有多个分区(Section)，每个分区都可以拥有分区的头部标题(titleForHeader)、分区的头部视图(viewForHeader)和分区的尾部标题(titleForFooter)、分区的尾部视图(viewForFooter)，如果设置了分区的头部/尾部标题的同时又设置了分区的头部/尾部视图，则运行之后只显示分区的头部/尾部视图，而不显示分区的头部/尾部标题，因为分区的头部/尾部视图的优先级要高于标题。如果设置了列表的头部视图(tableHeaderView)和列表的尾部视图(tableFooterView)并且也设置了分区的头部/尾部标题或者视图，之后再运行程序，拖动UITableView控件，（1）在Plain样式下，tableHeaderView和tableFooterView会跟着列表一起滚动，但是每个分区的头部/尾部标题或者视图会固定不动，不会随着控件的滚动而滚动。（2）在Grouped样式下，tableHeaderView、tableFooterView以及每个分区的头部/尾部标题或者视图都会跟着控件一起滚动。
 
 此Demo中在xib文件中已经把UITableView控件选为了分组样式(Grouped)样式。
 */
#import "ViewController.h"
#import "ZPCar.h"
#import "ZPCarGroup.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *groups;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
        
        //封装日系车的ZPCarGroup对象
        ZPCarGroup *carGroup2 = [[ZPCarGroup alloc] init];
        carGroup2.header = @"日系";
        carGroup2.footer = @"日本的汽车";
        
        ZPCar *car7 = [ZPCar carWithName:@"奥迪1" icon:@"m_9_100"];
        ZPCar *car8 = [ZPCar carWithName:@"宝马1" icon:@"m_8_100"];
        ZPCar *car9 = [ZPCar carWithName:@"奔驰1" icon:@"m_6_100"];
        
        carGroup2.cars = [NSArray arrayWithObjects:car7, car8, car9, nil];
        
        //封装日系车的ZPCarGroup对象
        ZPCarGroup *carGroup3 = [[ZPCarGroup alloc] init];
        carGroup3.header = @"日系";
        carGroup3.footer = @"日本的汽车";
        
        ZPCar *car10 = [ZPCar carWithName:@"奥迪1" icon:@"m_9_100"];
        ZPCar *car11 = [ZPCar carWithName:@"宝马1" icon:@"m_8_100"];
        ZPCar *car12 = [ZPCar carWithName:@"奔驰1" icon:@"m_6_100"];
        
        carGroup3.cars = [NSArray arrayWithObjects:car10, car11, car12, nil];
        
        //封装日系车的ZPCarGroup对象
        ZPCarGroup *carGroup4 = [[ZPCarGroup alloc] init];
        carGroup4.header = @"日系";
        carGroup4.footer = @"日本的汽车";
        
        ZPCar *car13 = [ZPCar carWithName:@"奥迪1" icon:@"m_9_100"];
        ZPCar *car14 = [ZPCar carWithName:@"宝马1" icon:@"m_8_100"];
        ZPCar *car15 = [ZPCar carWithName:@"奔驰1" icon:@"m_6_100"];
        
        carGroup4.cars = [NSArray arrayWithObjects:car13, car14, car15, nil];
        
        //封装日系车的ZPCarGroup对象
        ZPCarGroup *carGroup5 = [[ZPCarGroup alloc] init];
        carGroup5.header = @"日系";
        carGroup5.footer = @"日本的汽车";
        
        ZPCar *car16 = [ZPCar carWithName:@"奥迪1" icon:@"m_9_100"];
        ZPCar *car17 = [ZPCar carWithName:@"宝马1" icon:@"m_8_100"];
        ZPCar *car18 = [ZPCar carWithName:@"奔驰1" icon:@"m_6_100"];
        
        carGroup5.cars = [NSArray arrayWithObjects:car16, car17, car18, nil];
        
        _groups = [NSArray arrayWithObjects:carGroup0, carGroup1, carGroup2, carGroup3, carGroup4, carGroup5, nil];
    }
    
    return _groups;
}

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeInfoDark];
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

#pragma mark ————— UITableViewDelegate —————
/**
 每个分区的头部视图
 */
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIImageView *sectionHeaderImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scenery"]];
//
//    return sectionHeaderImageView;
//}

/**
 每个分区的尾部视图
 */
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIImageView *sectionFooterImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timg"]];
//
//    return sectionFooterImageView;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
