//
//  UIViewController+Ex.m
//  huashida_home
//
//  Created by 周建顺 on 15/8/14.
//  Copyright (c) 2015年 mxrcorp. All rights reserved.
//

#import "UIViewController+Ex.h"

#import <objc/runtime.h>

@implementation UIViewController(Ex)


//是否转为竖屏
- (void)interfaceOrientationToProtrait{
    
//    APP_DELEGATE.landOrPortraitBool = NO;
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];//这句话是防止手动先把设备置为竖屏,导致下面的语句失效.
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];

    
}


//是否转为横屏
- (void)interfaceOrientationToLandRight{
    
//    APP_DELEGATE.landOrPortraitBool = YES;
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];//这句话是防止手动先把设备置为横屏,导致下面的语句失效.
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
    
}


@end

