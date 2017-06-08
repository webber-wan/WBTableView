# WBTableView  [简书](http://www.jianshu.com/p/206f2122e6b3)
自定义万能用UITableView

![效果](https://github.com/webber-wan/WBTableView/blob/master/WBTableView/WBTableVIew.gif)

## 使用说明:
1. 把WBTableView文件夹拖到项目中;
2. 导入头文件```#import "WBTableView.h"```;
3. 使用```- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSourceArray:(NSArray *)dataSourceArray delegate:(id)delegate dataSourceBlock:(WBDataSourceBlock)dataSourceBlock``` 方法初始化WBTableView;
4. 使用```- (void)registerTableViewCellByClassName:(NSString *)className registerMode:(WBRegisterMode)registerMode identifier:(NSString *)identifier```注册自定义UITableViewCell;
5. (可选)选中某行cell需要调用```- (void)selectTableViewCell:(WBTableViewCellSelectBlock)tableViewCellSelectBlock```方法；

## 更新:

1. 新增tableView的组数个数自定义；
2. 新增cell行高自定义；

## 例：
```
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
```
