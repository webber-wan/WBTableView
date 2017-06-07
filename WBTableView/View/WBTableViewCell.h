//
//  WBTableViewCell.h
//  BlockDemo
//
//  Created by wanbin on 2017/6/7.
//  Copyright © 2017年 fenqihui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBTableViewCell : UITableViewCell

@property (nonatomic, strong) id data;

@property (weak, nonatomic) IBOutlet UILabel *wbLabel;

@end
