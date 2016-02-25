//
//  Test2ViewController3.m
//  zjs_Orientation
//
//  Created by 周建顺 on 15/10/27.
//  Copyright © 2015年 周建顺. All rights reserved.
//

#import "Test2ViewController3.h"

@interface Test2ViewController3 ()

@end

@implementation Test2ViewController3

+(instancetype)test2ViewController3{
    Test2ViewController3 *vc = [[Test2ViewController3 alloc] initWithNibName:@"Test2ViewController3" bundle:nil];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Test2ViewController3";
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{

    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        [[UIDevice currentDevice] performSelector:@selector(setOrientation:)
                                       withObject:[NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight]];
    }
}

-(BOOL)shouldAutorotate{
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}

//-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
//    return YES;
//}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeLeft;
}

-(void)viewWillDisappear:(BOOL)animated{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        [[UIDevice currentDevice] performSelector:@selector(setOrientation:)
                                       withObject:[NSNumber numberWithInt:UIInterfaceOrientationPortrait]];
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

@end
