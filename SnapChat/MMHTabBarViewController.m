//
//  MMHTabBarViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHTabBarViewController.h"
#import "MMHNavigationController.h"
#import "MMHTabBar.h"
#import "ViewController.h"
#import "MMHSecondVC.h"
#import "MMHThridVC.h"
#import "MMHFourVC.h"

@interface MMHTabBarViewController ()<tabbarDelegate>

@property (nonatomic, strong)MMHTabBar *costomTabBar;

@end

@implementation MMHTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化tabbar
    [self setUpTabBar];
    //添加子控制器
    [self setUpAllChildViewController];
    
}

//取出系统自带的tabbar并把里面的按钮删除掉
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    for (UIView * child in self.tabBar.subviews ) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)setUpTabBar{
    MMHTabBar *customTabBar = [[MMHTabBar alloc]init];
    customTabBar.delegate = self;
    customTabBar.frame = self.tabBar.bounds;
    self.costomTabBar = customTabBar;
    [self.tabBar addSubview:customTabBar];
}

-(void)tabBar:(MMHTabBar *)tabBar didselectedButtonFrom:(int)from to:(int)to{
    NSLog(@"%d, %d", from, to);
    self.selectedIndex = to;
    NSLog(@"%lu", (unsigned long)self.selectedIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpAllChildViewController{
    ViewController *homeVC = [[ViewController alloc]init];
    [self setupChildViewController:homeVC title:@"微信" imageName:@"tabbar_mainframe" seleceImageName:@"tabbar_mainframeHL"];
    
    MMHSecondVC *visitVC = [[MMHSecondVC alloc]init];
    [self setupChildViewController:visitVC title:@"通讯录" imageName:@"tabbar_contacts" seleceImageName:@"tabbar_contactsHL"];
    
    MMHThridVC *merchantVC = [[MMHThridVC alloc]init];
    [self setupChildViewController:merchantVC title:@"发现" imageName:@"tabbar_discover" seleceImageName:@"tabbar_discoverHL"];
    
    MMHFourVC *mineVC = [[MMHFourVC alloc]init];
    [self setupChildViewController:mineVC title:@"我" imageName:@"tabbar_me" seleceImageName:@"tabbar_meHL"];
    

    
}

-(void)setupChildViewController:(UIViewController*)controller
                          title:(NSString *)title
                      imageName:(NSString *)imageName
                seleceImageName:(NSString *)selectImageName{
    //    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    
    //包装导航控制器
    MMHNavigationController *nav = [[MMHNavigationController alloc]initWithRootViewController:controller];
    //UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];
    
    [self.costomTabBar addTabBarButtonWithItem:controller.tabBarItem];
    
}


@end
