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
    


}

-(void)tapped:(UIGestureRecognizer*)gesture{
    NSLog(@"tapped");
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


-(BOOL)shouldAutorotate{

    return NO;
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

-(NSUInteger)supportedInterfaceOrientations{
    
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
        
//        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
//        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
     
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
//        CATransform3D transform = CATransform3DMakeRotation(M_PI / 2, 0, 0, 1.0);
        
        //self.navigationController.view.layer.transform = transform;
        self.navigationController.view.transform = CGAffineTransformMakeRotation(M_PI_2);
        self.navigationController.view.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        //self.navigationController.view.frame =  CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);

    }else{
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
        self.navigationController.view.transform = CGAffineTransformMakeRotation(0);
        self.navigationController.view.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        //self.navigationController.view.frame =  CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }
    
    [UIView commitAnimations];
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
