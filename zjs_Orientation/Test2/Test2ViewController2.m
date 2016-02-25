//
//  Test2ViewController2.m
//  zjs_Orientation
//
//  Created by 周建顺 on 15/10/27.
//  Copyright © 2015年 周建顺. All rights reserved.
//

#import "Test2ViewController2.h"

@interface Test2ViewController2 ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@end

@implementation Test2ViewController2

+(instancetype)test2ViewController2{
    Test2ViewController2 *vc = [[Test2ViewController2 alloc] initWithNibName:@"Test2ViewController2" bundle:nil];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Test2ViewController2";
    
    self.view.backgroundColor = [UIColor purpleColor];
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewWillAppear:(BOOL)animated{
    [self orientChange:nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)orientChange:(NSNotification *)noti

{
    
    NSDictionary* ntfDict = [noti userInfo];
    NSLog(@">>>>>>>>>> : %@",ntfDict);
    
    CGRect bounds = [UIScreen mainScreen].bounds;
//    NSLog(@"width:%f",bounds.size.width);
//    NSLog(@"height:%f",bounds.size.height);
    self.label2.text = [NSString stringWithFormat:@"width:%f",bounds.size.width];
    self.label3.text = [NSString stringWithFormat:@"height:%f",bounds.size.height];
    UIDeviceOrientation  orient = [UIDevice currentDevice].orientation;
    
    /*
     
     UIDeviceOrientationUnknown,
     
     UIDeviceOrientationPortrait,            // Device oriented vertically, home button on the bottom
     
     UIDeviceOrientationPortraitUpsideDown,  // Device oriented vertically, home button on the top
     
     UIDeviceOrientationLandscapeLeft,       // Device oriented horizontally, home button on the right
     
     UIDeviceOrientationLandscapeRight,      // Device oriented horizontally, home button on the left
     
     UIDeviceOrientationFaceUp,              // Device oriented flat, face up
     
     UIDeviceOrientationFaceDown             // Device oriented flat, face down   */
    
    
    
    switch (orient)
    
    {
            
        case UIDeviceOrientationPortrait:
            
            self.label1.text = @"UIDeviceOrientationPortrait";
            
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            
            self.label1.text = @"UIDeviceOrientationLandscapeLeft";
            
            
            
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            
            
            
            self.label1.text = @"UIDeviceOrientationPortraitUpsideDown";
            
            break;
            
        case UIDeviceOrientationLandscapeRight:
            
            
            self.label1.text = @"UIDeviceOrientationLandscapeRight";
            
            
            break;
            
        case UIDeviceOrientationFaceDown:
            self.label1.text = @"UIDeviceOrientationFaceDown";
            break;
        case UIDeviceOrientationFaceUp:
            self.label1.text = @"UIDeviceOrientationFaceUp";
            break;
            
            case UIDeviceOrientationUnknown:
            self.label1.text = @"UIDeviceOrientationUnknown";
            break;
        default:
            
            break;
            
    }
    
}
- (IBAction)back:(id)sender {
    
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
- (IBAction)alert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"我是一条提示" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
}

-(BOOL)shouldAutorotate{
    return NO;
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



@end
