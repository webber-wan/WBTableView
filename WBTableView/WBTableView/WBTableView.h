//
//  WBTableView.h
//  BlockDemo
//  通用万能自定义UITableView
//  Created by wanbin on 2017/6/7.
//  Copyright © 2017年 fenqihui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 注册UITableViewCell类的方式

 - WBRegisterModeNormal:    默认注册类型（可以不写cell类名）
 - WBRegisterModeClass:     手动注册cell类型(必须写cell类名)
 - WBRegisterModeNib:       通过xib注册cell类型(必须写cell类名)
 */
typedef NS_ENUM(NSUInteger,WBRegisterMode) {
    WBRegisterModeNormal    =   1 << 0,
    WBRegisterModeClass     =   1 << 1,
    WBRegisterModeNib       =   1 << 2,
};


/**
 tableView:cellForRowAtIndexPath:方法内容回调函数

 @param wbCell 注册的cell类(wbCell是XXXCell Class类型)
 @param wbData 需要传给cell的数据(wbData可以是NSObject,可以是NSArray,可以是NSDictionary,可以是Model)
 */
typedef void(^WBDataSourceBlock)(id wbCell, id wbData);


/**
 选中的tableViewCell的方法回调函数

 @param wbCell 注册的cell类(wbCell是XXXCell Class类型)
 @param wbData 需要传给cell的数据(wbData可以是NSObject,可以是NSArray,可以是NSDictionary,可以是Model)
 */
typedef void(^WBTableViewCellSelectBlock)(id wbCell, id wbData);


@interface WBTableView : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *wbTableView;


/**
 初始化自定义tableView

 @param frame 位置、大小
 @param style tableView类型(默认类型，组类型)
 @param dataSourceArray 传入tableView的数据源数组
 @param delegate tableView所在的视图、控制器
 @param dataSourceBlock tableView:cellForRowAtIndexPath:方法内容回调
 @return wbTableView
 */
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSourceArray:(NSArray *)dataSourceArray delegate:(id)delegate dataSourceBlock:(WBDataSourceBlock)dataSourceBlock;


/**
 注册自定义UITableViewCell

 @param className 注册的UITableViewCell类名
 @param registerMode 注册UITableViewCell类的方式
 @param identifier 注册的UITableViewCell的标识
 */
- (void)registerTableViewCellByClassName:(NSString *)className registerMode:(WBRegisterMode)registerMode identifier:(NSString *)identifier;


/**
 选中某行cell

 @param tableViewCellSelectBlock 选中的cell方法回调函数
 */
- (void)selectTableViewCell:(WBTableViewCellSelectBlock)tableViewCellSelectBlock;

@end
