//
//  SSPhotoCropperDemoViewController.h
//  SSPhotoCropperDemo
//
//  Created by Ahmet Ardal on 10/17/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSPhotoCropperViewController.h"

@interface SSPhotoCropperDemoViewController: UIViewController<SSPhotoCropperDelegate,
                                                              UITableViewDelegate,
                                                              UITableViewDataSource>
{
    UIImageView *photoPreviewImageView;
    UIImage *croppedPhoto;
}

@property (nonatomic, retain) IBOutlet UIImageView *photoPreviewImageView;
@property (nonatomic, retain) UIImage *croppedPhoto;

@end
