//
//  SSPhotoCropperDemoAppDelegate.h
//  SSPhotoCropperDemo
//
//  Created by Ahmet Ardal on 10/17/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSPhotoCropperDemoViewController;

@interface SSPhotoCropperDemoAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SSPhotoCropperDemoViewController *viewController;

@end
