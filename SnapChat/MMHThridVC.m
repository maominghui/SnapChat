//
//  MMHThridVC.m
//  SnapChat
//
//  Created by 茆明辉 on 15/11/25.
//  Copyright © 2015年 com.mmh. All rights reserved.
//

#import "MMHThridVC.h"

@interface MMHThridVC ()<UITableViewDelegate,UITableViewDataSource>
//声明了一个存放数据的数组和用于显示单元格的两个对象
@property(strong,nonatomic)NSMutableArray *_firend;
@property(strong,nonatomic)NSMutableArray *list2;
@property(strong,nonatomic)NSMutableArray *list3;
@property(strong,nonatomic)NSMutableArray *list4;

@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)UITableViewCell *tableViewCell;


@end

@implementation MMHThridVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";
    //初始化表格
    CGRect frame=CGRectMake(0, 0, SCREENWIDTH, self.view.frame.size.height);
    self.tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
    //设置协议，意思就是UITableView类的方法交给了tabView这个对象，让完去完成表格的一些设置操作
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    //把tabView添加到视图之上
    [self.view addSubview:self.tableView];
    //存放显示在单元格上的数据(取名叫arraylist不叫array是wxviewcontroller里面有了array，不能重复)
    NSMutableArray *arraylist=[NSMutableArray arrayWithObjects:@"朋友圈",nil];
    NSMutableArray *arraylist2=[NSMutableArray arrayWithObjects:@"扫一扫",@"摇一摇",nil];
    NSMutableArray *arraylist3=[NSMutableArray arrayWithObjects:@"附近的人",@"漂流瓶",nil];
    //两种方法
    NSMutableArray *arraylist4=[[NSMutableArray alloc] initWithObjects:@"购物",@"游戏", nil];

    self._firend  = arraylist;
    self.list2 = arraylist2;
    self.list3 = arraylist3;
    self.list4 = arraylist4;

}
#pragma mark -实现协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [self._firend count];//每个分区通常对应不同的数组，返回其元素个数来确定分区的行数
            break;
        case 1:
            return [self.list2 count];
            break;
        case 2:
            return [self.list3 count];//每个分区通常对应不同的数组，返回其元素个数来确定分区的行数
            break;
        case 3:
            return [self.list4 count];
            break;
        default:
            return 0;
            break;
    }
}
//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    //初始化cell并指定其类型，也可自定义cell
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    switch (indexPath.section) {
        case 0://对应各自的分区
            [[cell textLabel]setText:[self._firend objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        case 1://对应各自的分区
            [[cell textLabel]setText:[self.list2 objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        case 2://对应各自的分区
            [[cell textLabel]setText:[self.list3 objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        case 3://对应各自的分区
            [[cell textLabel]setText:[self.list4 objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        default:
            [[cell textLabel]setText:@"未知"];
            break;
    }
   cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//cell的右边有一个小箭头，距离右边有十几像素；
    return cell;
}

//设置单元格高度
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

//选中单元格所产生事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //弹出警告信息
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"测试" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //在此处填写点击取消按钮后执行的方法

    }];
    [alertView addAction:cancelButton];
    [self presentViewController:alertView animated:YES completion:Nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
