//
//  APPStoreViewController.m
//  APPStoreHeader
//
//  Created by xujunhao on 2017/6/13.
//  Copyright © 2017年 cocoadogs. All rights reserved.
//

#import "APPStoreViewController.h"

@interface APPStoreViewController ()

@property (nonatomic, strong) UIView *headerView;

@end

@implementation APPStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.tableHeaderView = self.headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // 64应该为状态栏和导航栏高度
    // automaticallyAdjustsScrollViewInsets这个属性默认为true，一个UIScrollView在有导航栏的控制器中，坐标会从导航栏底部计算
    CGFloat offset = self.tableView.contentOffset.y;
    if (offset <= -64) {
        CGRect frame = self.tableView.tableHeaderView.frame;
        frame.origin.y = offset + 64;
        self.tableView.tableHeaderView.frame = frame;
    }
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"APPStoreViewController";
    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 140)];
        _headerView.backgroundColor = [UIColor redColor];
    }
    return _headerView;
}

@end
