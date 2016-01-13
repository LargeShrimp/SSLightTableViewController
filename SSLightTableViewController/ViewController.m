//
//  ViewController.m
//  SSLightTableViewController
//
//  Created by taitanxiami on 16/1/13.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "ViewController.h"
#import "CustomModel.h"
#import "SSTableViewDataSource.h"
#import "SSTableViewCell.h"
#import "SSTableViewCell+ConfigCell.h"
static NSString * const PhotoCellIdentifier = @"PhotoCell";
@interface ViewController ()<UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic, strong) SSTableViewDataSource *datasource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Light UITableView";
    
    self.dataArr = [NSMutableArray arrayWithCapacity:2];
    for (int i=0; i<16; i++) {
        int x = arc4random() % 100;
        NSString *string=[NSString stringWithFormat:@"    (random%d) 君子性非异也，善假于物也！",x];
        CustomModel *model = [[CustomModel alloc] init];
        model.title = string;
        [self.dataArr addObject:model];
    }

    [self configTableView];
}

- (void)configTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate  = self;
    [self.view addSubview:self.tableView];
    
    TableVieCellConfigBlock cellBlcok = ^(SSTableViewCell *cell, CustomModel *model){
        
        [cell configCellWithModel:model];
    };
    self.datasource = [[SSTableViewDataSource alloc]initWithItems:self.dataArr cellIdentifer:PhotoCellIdentifier configCellBlock:cellBlcok];
    
    self.tableView.dataSource = self.datasource;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
