//
//  WB1TableViewCell.m
//  BlockDemo
//
//  Created by wanbin on 2017/6/7.
//  Copyright © 2017年 fenqihui. All rights reserved.
//

#import "WB1TableViewCell.h"

@implementation WB1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
   
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // cell页面布局
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.wbLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 200, 30)];
    self.wbLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.wbLabel];
}

- (void)setData:(id)data {
    self.wbLabel.text = data;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
