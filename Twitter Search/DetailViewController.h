//
//  DetailViewController.h
//  Twitter Search
//
//  Created by Aditya Trivedi on 2013-01-15.
//  Copyright (c) 2013 Aditya Trivedi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id tweetTextDetailItem;
@property (strong, nonatomic) id usernameDetailItem;
@property (strong, nonatomic) id profilePictureDetailItem;
@property (strong, nonatomic) id timeTheTweetWasCreatedDetailedItem;

@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UITextView *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *timeTheTweetWasCreated;


@end
