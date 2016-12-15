//
//  ViewController.m
//  Timeline
//
//  Created by juanmao on 16/12/7.
//  Copyright © 2016年 juanmao. All rights reserved.
//

#import "ViewController.h"
#import "InfoModel.h"
#import "InfoTableViewCell.h"
#import "InfoItemTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView   *tableView;
@property(nonatomic, strong)InfoModel     *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"时间轴";
    [self initData];
}


- (void)initData{
        ///制造假数据
    self.model = [InfoModel new];
    self.model.prodouctImg = @"icon_crowdfunded";
    self.model.deliveryStatus = @"已签收";
    self.model.deliveryCompany = @"菜鸟裹果";
    self.model.deliveryId = @"32443804";
    self.model.companyPhone = @"123456";
    NSMutableArray *itemArr = [NSMutableArray array];
    for (int i  = 0; i<10; i++) {
        ItemModel *itemModel = [ItemModel new];
        if (i%2==0) {
            itemModel.deliveryInfo = [NSString stringWithFormat:@"第%d条信息,balabalabalabalabala超长文本超长文本超长文本超长文本超长文本,手机号:15895893749",i];
        }else{
            itemModel.deliveryInfo = [NSString stringWithFormat:@"第%d条信息,手机号:15895893749",i];
        }
        itemModel.isCurrent = i == 0;
        itemModel.deliveryTime = @"1476786595000";
        [itemArr addObject:itemModel];
    }
    self.model.itemsArr = itemArr;
    [self.tableView reloadData];
}

- (UITableView *)tableView{
    if (!_tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}


#pragma mark  UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==0?115:100;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 10;
    }else{
        return 0.001;
    }
}

#pragma mark   UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section==0?1:self.model.itemsArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *cellId = @"InfoCell";
        InfoTableViewCell *infoCell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!infoCell) {
            infoCell = [[[NSBundle mainBundle]loadNibNamed:@"InfoTableViewCell" owner:self options:nil]lastObject];
        }
        
        infoCell.model = self.model;
        infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return infoCell;
    }else{
        InfoItemTableViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"deliveryStatusCell"];
        if (!itemCell)
        {
            itemCell = [[InfoItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"deliveryStatusCell"];
            itemCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if (indexPath.row < self.model.itemsArr.count){
            itemCell.model = self.model.itemsArr[indexPath.row];
        }
        return itemCell;

    }
}
@end
