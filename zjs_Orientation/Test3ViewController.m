//
//  Test3ViewController.m
//  zjs_Orientation
//
//  Created by 周建顺 on 16/4/5.
//  Copyright © 2016年 周建顺. All rights reserved.
//

#import "Test3ViewController.h" 
#import "UIViewController+Ex.h"

@interface Test3ViewController ()

@property (nonatomic,assign) BOOL land;

@end

@implementation Test3ViewController

@synthesize land = _land;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate{
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    if (_land) {
        return UIInterfaceOrientationMaskLandscapeRight;
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{

    if (_land) {
        return UIInterfaceOrientationLandscapeRight;
    }else{
        return UIInterfaceOrientationPortrait;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)rotate:(id)sender {
    self.land = !self.land;
    
}

-(void)setLand:(BOOL)land{
    _land = land;
    
    if (land) {
        [self interfaceOrientationToLandRight];
    }else{
        [self interfaceOrientationToProtrait];
    }
    
}

@end
