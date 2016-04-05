//
//  Test1ViewController.m
//  zjs_Orientation
//
//  Created by 周建顺 on 15/9/16.
//  Copyright (c) 2015年 周建顺. All rights reserved.
//

#import "Test1ViewController.h"
#import "Test2ViewController1.h"


@interface Test1ViewController ()

@property (nonatomic) BOOL isLand;
@property (nonatomic) BOOL isCurrentLand;

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapped:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    [tap requireGestureRecognizerToFail:doubleTap];
    
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
    
    
    [self.navigationController.view addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];

}

-(void)didEnterBackground:(NSNotification*)sender{
    if (self.isCurrentLand) {
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    }
}

-(void)enterForeground:(NSNotification*)sender{
//    if (self.isCurrentLand) {
//        self.isLand = YES;
//    }
}

-(void)tapped:(UIGestureRecognizer*)gesture{
    NSLog(@"tapped");
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)doubleTapped:(UIGestureRecognizer*)gesture{
    NSLog(@"doubleTapped");
}

-(void)leftSwipe:(UIGestureRecognizer*)gesture{
    NSLog(@"leftSwipe");
}

-(void)rightSwipe:(UIGestureRecognizer*)gesture{
    NSLog(@"rightSwipe");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    if (self.isCurrentLand) {
        self.isLand = YES;
    }

//    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
//    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    //[UIView setAnimationsEnabled:NO];
}

-(void)viewDidAppear:(BOOL)animated{
   // [UIView setAnimationsEnabled:YES];
//    
//        [[UIApplication sharedApplication]  setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}

-(void)viewWillDisappear:(BOOL)animated{
   

}



- (IBAction)alert:(id)sender {
    

    CGRect bounds = [UIScreen mainScreen].bounds;
        NSLog(@"width:%f",bounds.size.width);
        NSLog(@"height:%f",bounds.size.height);
    

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    NSLog(@"%@",change);
    
    self.navigationController.view.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

- (IBAction)back:(id)sender {
    
    
    if (self.isLand) {
        self.isLand = NO;
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)next:(id)sender {
    
    if (self.isLand) {
        self.isLand = NO;
    }
    
    Test2ViewController1 *vc = [Test2ViewController1 test2ViewController1];
    [self.navigationController pushViewController:vc animated:YES];
}
//
-(BOOL)shouldAutorotate{
    
    return YES;
}
//
-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    if (self.isLand) {
        return UIInterfaceOrientationMaskLandscape;
    }
    return UIInterfaceOrientationMaskPortrait;
}


-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    if (self.isLand) {
        return UIInterfaceOrientationLandscapeLeft;
    }
    return UIInterfaceOrientationPortrait;
}

- (IBAction)rotationButtonTapped:(id)sender {


    self.isLand =!self.isLand;
    self.isCurrentLand = self.isLand;
}

-(void)setIsLand:(BOOL)isLand{
    _isLand = isLand;
    NSTimeInterval duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    
    
    
    if (isLand) {
         [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];//这句话是防止手动先把设备置为横屏,导致下面的语句失效.
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
        
        /*
//        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
//        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
     
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
//        CATransform3D transform = CATransform3DMakeRotation(M_PI / 2, 0, 0, 1.0);
        
        //self.navigationController.view.layer.transform = transform;
        self.navigationController.view.transform = CGAffineTransformMakeRotation(M_PI_2);
        self.navigationController.view.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        //self.navigationController.view.frame =  CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
*/
    }else{
      
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];//这句话是防止手动先把设备置为竖屏,导致下面的语句失效.
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];
        /*
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
        self.navigationController.view.transform = CGAffineTransformMakeRotation(0);
        self.navigationController.view.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        //self.navigationController.view.frame =  CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
         */
    }
    
    [UIView commitAnimations];
    
    if (isLand) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"dasda" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor redColor];
        button.frame = CGRectMake(self.view.frame.size.width-50, 100, 50, 50);
        [button addTarget:self action:@selector(btnTap:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    

}

-(void)btnTap:(UIButton*)sender{
    NSLog(@"btnTap");
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
