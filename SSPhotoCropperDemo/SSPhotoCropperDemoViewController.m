//
//  SSPhotoCropperDemoViewController.m
//  SSPhotoCropperDemo
//
//  Created by Ahmet Ardal on 10/17/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import "SSPhotoCropperDemoViewController.h"

@implementation SSPhotoCropperDemoViewController

@synthesize photoPreviewImageView, croppedPhoto;

- (void) dealloc
{
    [self.photoPreviewImageView release];
    [self.croppedPhoto release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void) viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma -
#pragma UITableViewDelegate & UITableViewDataSource Methods

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"DefaultCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellId] autorelease];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    NSString *titles[] = {
        @"Cute Cat #1", @"Cute Cat #2",
        @"Cute Cat #3", @"Cute Dog #1",
        @"Cute Dog #2", @"Cute Dog #3"
    };
    cell.textLabel.text = titles[indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *imageNames[] = {
        @"cute_cat_1.jpg", @"cute_cat_2.jpg",
        @"cute_cat_3.jpg", @"cute_dog_1.jpg",
        @"cute_dog_2.jpg", @"cute_dog_3.jpg"
    };
    UIImage *photo = [UIImage imageNamed:imageNames[indexPath.row]];

    SSPhotoCropperViewController *photoCropper =
        [[SSPhotoCropperViewController alloc] initWithPhoto:photo
                                                   delegate:self
                                                     uiMode:SSPCUIModePresentedAsModalViewController
                                            showsInfoButton:YES];
    [photoCropper setMinZoomScale:0.75f];
    [photoCropper setMaxZoomScale:1.50f];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:photoCropper];
    [self presentModalViewController:nc animated:YES];
    [photoCropper release];
    [nc release];
}


#pragma -
#pragma SSPhotoCropperDelegate Methods

- (void) photoCropper:(SSPhotoCropperViewController *)photoCropper
         didCropPhoto:(UIImage *)photo
{
    self.croppedPhoto = photo;
    self.photoPreviewImageView.image = photo;
    [photoCropper dismissModalViewControllerAnimated:YES];
}

- (void) photoCropperDidCancel:(SSPhotoCropperViewController *)photoCropper
{
    [photoCropper dismissModalViewControllerAnimated:YES];
}

@end
