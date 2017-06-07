//
//  WBBaseViewController.h
//  BlockDemo
//
//  Created by wanbin on 2017/6/5.
//  Copyright © 2017年 fenqihui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ResultBackBlock) (NSString *reslut);

@interface WBBaseViewController : UIViewController

/** 退出提示block **/
@property (nonatomic, copy) ResultBackBlock resultBackBlock;

@end
