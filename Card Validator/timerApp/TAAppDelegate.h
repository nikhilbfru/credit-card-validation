//
//  TAAppDelegate.h
//  timerApp
//
//  Created by Nikhil Challagulla on 5/30/13.
//  Copyright (c) 2013 Nikhil Challagulla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class TAViewController;

@interface TAAppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TAViewController *viewController;

@end
