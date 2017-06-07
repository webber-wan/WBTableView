//
//  WBTableView.m
//  BlockDemo
//
//  Created by wanbin on 2017/6/7.
//  Copyright © 2017年 fenqihui. All rights reserved.
//

#import "WBTableView.h"

@interface WBTableView ()


@property (nonatomic, copy)NSString *identifier;

@property (nonatomic, copy)NSArray *dataSourceArray;

@property (nonatomic, copy) WBDataSourceBlock dataSourceBlock;

@property (nonatomic, copy) WBTableViewCellSelectBlock tableViewCellSelectBlock;

@property (nonatomic, strong)UITableViewCell *cell;

@property (nonatomic, assign) id delegate;

@end

@implementation WBTableView

#pragma mark - 初始化视图
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSourceArray:(NSArray *)dataSourceArray delegate:(id)delegate dataSourceBlock:(WBDataSourceBlock)dataSourceBlock{
    if ([super init] == self) {
        self.dataSourceArray = dataSourceArray;
        self.dataSourceBlock = [dataSourceBlock copy];
        self.delegate = delegate;
        [self initTableViewWithFrame:frame style:style];
    }
    
    return self;
}


/**
 初始化系统UITableView

 @param frame 位置、大小
 @param style UITableView类型
 */
- (void)initTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    _wbTableView = [[UITableView alloc] initWithFrame:frame style:style];
    _wbTableView.delegate = self;
    _wbTableView.dataSource = self;
    
    //判断_delegate是什么类型
    if ([_delegate isKindOfClass:[UIView class]]) {
        [_delegate addSubview:_wbTableView];
    }else if([_delegate isKindOfClass:[UIViewController class]]){
        [((UIViewController *)_delegate).view addSubview:_wbTableView];
    }else {
        NSLog(@"delegate is %@",NSStringFromClass(_delegate));
        assert(_delegate);
    }
    
}

#pragma mark - 内部方法
- (void)selectTableViewCell:(WBTableViewCellSelectBlock)tableViewCellSelectBlock {
    if (!self.tableViewCellSelectBlock) {
        self.tableViewCellSelectBlock = tableViewCellSelectBlock;
    }
}

#pragma mark - UITableView
#pragma mark -- UITableViewDataSource
- (void)registerTableViewCellByClassName:(NSString *)className registerMode:(WBRegisterMode)registerMode identifier:(NSString *)identifier {
    
    self.identifier = identifier;
    
    if (registerMode != WBRegisterModeNormal && (className == nil || [className isEqualToString:@""])) {
        assert("无效的cell");
        return;
    }
    //判断注册UITableViewCell类的方式，如果是默认注册类型可以不写cell类名
    if (registerMode == WBRegisterModeNormal) {
        [_wbTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:_identifier];
    }else if (registerMode == WBRegisterModeClass) {
        Class class = NSClassFromString(className);//通过类名获取类对象
        [_wbTableView registerClass:[class class] forCellReuseIdentifier:_identifier];
    }else {
        [_wbTableView registerNib:[UINib nibWithNibName:className bundle:nil] forCellReuseIdentifier:_identifier];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_dataSourceArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier forIndexPath:indexPath];
    id data = [_dataSourceArray objectAtIndex:indexPath.row];
    _dataSourceBlock(cell, data);
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了第%ld行",(long)indexPath.row);
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    id data = [_dataSourceArray objectAtIndex:indexPath.row];
    _tableViewCellSelectBlock(cell, data);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}


@end
