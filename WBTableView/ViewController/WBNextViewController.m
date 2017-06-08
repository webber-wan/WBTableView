//
//  WBNextViewController.m
//  BlockDemo
//
//  Created by wanbin on 2017/6/5.
//  Copyright © 2017年 fenqihui. All rights reserved.
//

#import "WBNextViewController.h"
#import "WBTableView.h"
#import "WBTableViewCell.h"
#import "WB1TableViewCell.h"

@interface WBNextViewController ()

@property (nonatomic, strong) UIButton *backBtn;


@property (nonatomic, copy) NSArray *dataSourceArray;

@property (nonatomic , strong) WBTableView *wbTableView;

@end

@implementation WBNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(15, 20, 60, 30);
    _backBtn.backgroundColor = [UIColor redColor];
    [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backBtn];
    
    [self setupTableView];
}


/**
 初始化tableView
 */
- (void)setupTableView {
    
    //创建数据源数据
    NSMutableArray *muArray = [[NSMutableArray alloc] init];
    for(int i = 0 ; i < 10; i++) {
        [muArray addObject:[NSString stringWithFormat:@"这是第%d行",i+1]];
    }
    self.dataSourceArray = [muArray copy];
    
    //初始化自定义tableView
    _wbTableView = [[WBTableView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 50) style:UITableViewStylePlain dataSourceArray:_dataSourceArray delegate:self dataSourceBlock:^(id wbCell, id wbData) {
        WB1TableViewCell *cell = (WB1TableViewCell *)wbCell;
        cell.data = wbData;
    }];
    
    //注册自定义tableViewCell
    [_wbTableView registerTableViewCellByClassName:@"WB1TableViewCell" registerMode:WBRegisterModeClass identifier:@"identifier"];
    
    //tableViewCell选中
    [_wbTableView selectTableViewCell:^(id wbCell, id wbData) {
        NSLog(@"data = %@",wbData);
    }];
    
    //新增：
    //设置section个数
    _wbTableView.sectionNumber = 3;
    
    //设置cell行高
    _wbTableView.cellHeight = 88;
}

- (void)backBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.resultBackBlock) {
        self.resultBackBlock(@"返回成功");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
