//
//  MenuViewController.m
//  护林宝
//
//  Created by Apple on 11/24/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "MenuViewController.h"
#import "LocationViewController.h"
#import "ConnectTableViewController.h"


@interface MenuViewController ()

@property (strong, nonatomic) UIImageView * baoGaoUIImageView;    //报告
@property (strong, nonatomic) UIImageView * daKaUIImageView;      //打卡
@property (strong, nonatomic) UIImageView * lianXiRenUIImageView; //联系人
@property (strong, nonatomic) UIImageView * duiJiangUIImageView;  //对讲

@property (strong, nonatomic) UILabel * baoGaoLabel;
@property (strong, nonatomic) UILabel * daKaLabel;
@property (strong, nonatomic) UILabel * lianXiRenLabel;
@property (strong, nonatomic) UILabel * duiJiangLabel;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"护林宝";
    [self initView];
}

#pragma mark - 初始化View

- (void)initView {
    
    //报告
    self.baoGaoUIImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 110, 60, 60)];
    self.baoGaoUIImageView.image = [UIImage imageNamed:@"58b"];
    [self.view addSubview:self.baoGaoUIImageView];
    self.baoGaoUIImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(baoGaoPress)];
    [self.baoGaoUIImageView addGestureRecognizer:singleTap1];
    self.baoGaoLabel = [[UILabel alloc]initWithFrame:CGRectMake(45, 180, 60, 30)];
    self.baoGaoLabel.text = @"报告";
    self.baoGaoLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    [self.view addSubview:self.baoGaoLabel];
    
    //打卡
    self.daKaUIImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 110, 60, 60)];
    self.daKaUIImageView.image = [UIImage imageNamed:@"58c"];
    [self.view addSubview:self.daKaUIImageView];
    self.daKaUIImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(daKaPress)];
    [self.daKaUIImageView addGestureRecognizer:singleTap2];
    self.daKaLabel = [[UILabel alloc]initWithFrame:CGRectMake(115, 180, 60, 30)];
    self.daKaLabel.text = @"打卡";
    self.daKaLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    [self.view addSubview:self.daKaLabel];
    
    //联系人
    self.lianXiRenUIImageView = [[UIImageView alloc]initWithFrame:CGRectMake(170, 110, 60, 60)];
    self.lianXiRenUIImageView.image = [UIImage imageNamed:@"58d"];
    [self.view addSubview:self.lianXiRenUIImageView];
    self.lianXiRenUIImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lianXiRenPress)];
    [self.lianXiRenUIImageView addGestureRecognizer:singleTap3];
    
    self.lianXiRenLabel = [[UILabel alloc]initWithFrame:CGRectMake(180, 180, 60, 30)];
    self.lianXiRenLabel.text = @"联系人";
    self.lianXiRenLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    [self.view addSubview:self.lianXiRenLabel];
    
    //对讲
    self.duiJiangUIImageView = [[UIImageView alloc]initWithFrame:CGRectMake(240, 110, 60, 60)];
    self.duiJiangUIImageView.image = [UIImage imageNamed:@"58f"];
    [self.view addSubview:self.duiJiangUIImageView];
    self.duiJiangUIImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(duiJiangPress)];
    [self.duiJiangUIImageView  addGestureRecognizer:singleTap4];
    self.duiJiangLabel = [[UILabel alloc]initWithFrame:CGRectMake(255, 180, 60, 30)];
    self.duiJiangLabel.text = @"对讲";
    self.duiJiangLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    [self.view addSubview:self.duiJiangLabel];

}

#pragma mark - 报告

- (void)baoGaoPress {
    
    
}

#pragma mark - 打卡

- (void)daKaPress {
    
    LocationViewController * loc = [[self storyboard] instantiateViewControllerWithIdentifier:@"LocViewController"];
    [self.navigationController pushViewController:loc animated:YES];
}

#pragma mark - 联系人

- (void)lianXiRenPress {

    ConnectTableViewController * connectTableViewController = [[ConnectTableViewController alloc]init];
    [self.navigationController pushViewController:connectTableViewController animated:YES];
    
}

#pragma mark - 对讲

- (void)duiJiangPress {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
