
//  CustomNavigationController.m
//  zjs_Orientation
//
//  Created by 周建顺 on 15/9/18.
//  Copyright (c) 2015年 周建顺. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)shouldAutorotate
{
    return [self.viewControllers.lastObject shouldAutorotate];
    
}


-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    //return UIInterfaceOrientationMaskLandscapeRight;
    return [self.viewControllers.lastObject supportedInterfaceOrientations];
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.viewControllers.lastObject preferredInterfaceOrientationForPresentation];
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return [self.viewControllers.lastObject
//                   
//            shouldAutorotateToInterfaceOrientation:interfaceOrientation];;
//}

@end
