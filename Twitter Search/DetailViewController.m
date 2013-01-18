//
//  DetailViewController.m
//  Twitter Search
//
//  Created by Aditya Trivedi on 2013-01-15.
//  Copyright (c) 2013 Aditya Trivedi. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize tweetTextDetailItem = _tweetTextDetailItem;
@synthesize usernameDetailItem = _usernameDetailItem;
@synthesize profilePictureDetailItem = _profilePictureDetailItem;


#pragma mark - Managing the detail item


- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.tweetTextDetailItem)
        self.tweetText.text = [self.tweetTextDetailItem description];
    
    if (self.usernameDetailItem)
        self.username.text = [self.usernameDetailItem description];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
