//
//  ViewController.m
//  WBTableView
//
//  Created by wanbin on 2017/6/7.
//  Copyright © 2017年 fenqihui. All rights reserved.
//

#import "ViewController.h"
#import "WBNextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = [UIColor yellowColor];
}

- (IBAction)nextButtonClick:(id)sender {
    
    WBNextViewController *nextVC = [[WBNextViewController alloc] init];
    nextVC.resultBackBlock = ^(NSString *reslut) {
        
        NSLog(@"reslut = %@",reslut);
    };
    //    [self.navigationController pushViewController:nextVC animated:YES];
    [self presentViewController:nextVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
