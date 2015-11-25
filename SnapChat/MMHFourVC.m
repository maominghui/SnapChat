//
//  MMHFourVC.m
//  SnapChat
//
//  Created by 茆明辉 on 15/11/25.
//  Copyright © 2015年 com.mmh. All rights reserved.
//

#import "MMHFourVC.h"
#import "MMHMineModel.h"
#import "MMHMineCell.h"
#import "MMHMineHeaderView.h"
//#import "MMHMineBigTitleCell.h"

@interface MMHFourVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong)UITableView *mineTableView;
@property(nonatomic, strong)NSArray     *mineModelArray;


@end

@implementation MMHFourVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    
    [self initView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initView
{
    
    self.mineTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 64) withDelegate:self];
    [self.view addSubview:self.mineTableView];
    
    
}

/**
 *  @return
 *
 */
-(NSArray *)mineModelArray{
    if (_mineModelArray == nil) {
        NSArray *mineArray = [GetPlistArray arrayWithString:@"MineInformationData.plist"];
        NSMutableArray *dicArray = [NSMutableArray array];
        for (NSDictionary *dict in mineArray) {
            MMHMineModel *model = [MMHMineModel mineModel:dict];
            [dicArray addObject:model];
        }
        _mineModelArray = dicArray;
    }
    
    return  _mineModelArray;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return self.mineModelArray.count;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 75;
    }else{
        return 5;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 9;
}

//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }
    else{
        return 35;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        MMHMineHeaderView *headView = [MMHMineHeaderView headViewWithTableView:tableView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
        [headView addGestureRecognizer:tap];
        return headView;
    }else{
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 5)];
        return headerView;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    MMHMineModel *mineModel = self.mineModelArray [indexPath.row];
    MMHMineCell *cell = [MMHMineCell cellWithTableView:tableView mineModel:mineModel];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
    
}



@end
