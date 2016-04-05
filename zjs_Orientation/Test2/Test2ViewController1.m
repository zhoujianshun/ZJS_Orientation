//
//  Test2ViewController1.m
//  zjs_Orientation
//
//  Created by 周建顺 on 15/10/27.
//  Copyright © 2015年 周建顺. All rights reserved.
//

#import "Test2ViewController1.h"
#import "Test2ViewController2.h"
#import "Test2ViewController3.h"
#import "AppDelegate.h"

@interface Test2ViewController1 ()

@property (nonatomic) BOOL isLand;

@end

@implementation Test2ViewController1

+(instancetype)test2ViewController1{

    Test2ViewController1 *vc = [[Test2ViewController1 alloc] initWithNibName:@"Test2ViewController1" bundle:nil];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Test2ViewController1";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:NULL];
    

    
    
}


-(void)viewDidAppear:(BOOL)animated{
    //self.isLand = YES;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"ofObject:%@",object);
}

-(void)dealloc{
    [self.view removeObserver:self forKeyPath:@"frame"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)NextView1:(id)sender {
    Test2ViewController2 *vc = [Test2ViewController2 test2ViewController2];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)presentView:(id)sender {
      Test2ViewController2 *vc = [Test2ViewController2 test2ViewController2];
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)nextView3:(id)sender {
    Test2ViewController3 *vc = [Test2ViewController3 test2ViewController3];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)rotation:(id)sender {
    if (self.isLand) {
        self.isLand = NO;
    }else{
        self.isLand = YES;
    }

}

-(void)setIsLand:(BOOL)isLand{
    _isLand = isLand;
    if (_isLand) {
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    }else{
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    }
   
    
//        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        appDelegate.allowRotation = 1;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
}

-(BOOL)shouldAutorotate{
    return NO;
}


-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    if (self.isLand) {
        return UIInterfaceOrientationMaskLandscapeRight;
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }

}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    if (self.isLand) {
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

@end
