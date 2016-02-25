//
//  ViewController.m
//  zjs_Orientation
//
//  Created by 周建顺 on 15/9/16.
//  Copyright (c) 2015年 周建顺. All rights reserved.
//

#import "ViewController.h"
#import "Test2ViewController1.h"


@interface ViewController ()<UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 1) {
        Test2ViewController1 *vc1 = [Test2ViewController1 test2ViewController1];
        [self.navigationController pushViewController:vc1 animated:YES];
    }
    

}




@end
