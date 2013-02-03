//
//  DetailViewController.m
//  Twitter Search
//
//  Created by Aditya Trivedi on 2013-01-15.
//  Copyright (c) 2013 Aditya Trivedi. All rights reserved.
//

#import "DetailViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize tweetTextDetailItem = _tweetTextDetailItem;
@synthesize usernameDetailItem = _usernameDetailItem;
@synthesize profilePictureDetailItem = _profilePictureDetailItem;
@synthesize tweetText = _tweetText;


#pragma mark - Managing the detail item

- (void)configureView
{
    if (self.tweetTextDetailItem)
        self.tweetText.text = [self.tweetTextDetailItem description];
    
    if (self.usernameDetailItem)
        self.username.text = [@"" stringByAppendingFormat:@"@%@",[self.usernameDetailItem description]] ;
    
    if (self.timeTheTweetWasCreatedDetailedItem)
        self.timeTheTweetWasCreated.text = [self.timeTheTweetWasCreatedDetailedItem description];
    
    if (self.profilePictureDetailItem) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           
            // replacing the "normal.jpeg"/"normal.jpeg"/"normal.jpeg" extension of image url with "bigger.jpeg"
            NSMutableString *imageURL = [[self.profilePictureDetailItem description] mutableCopy];
            NSRange range;

            if ([[imageURL substringFromIndex:(imageURL.length - 3)] isEqualToString: @"png"]) {
                range.location = imageURL.length - 10;
                range.length = 10;
                [imageURL deleteCharactersInRange:range];
                [imageURL insertString:@"bigger.png" atIndex:imageURL.length];
                NSLog(@"IMAGE URL (PNG): %@",imageURL);
            }
            
            else if ([[imageURL substringFromIndex:(imageURL.length - 3)] isEqualToString: @"jpg"]) {
                
                range.location = imageURL.length - 10;
                range.length = 10;
                [imageURL deleteCharactersInRange:range];
                [imageURL insertString:@"bigger.jpg" atIndex:imageURL.length];
                
                NSLog(@"IMAGE URL (JPG): %@",imageURL);
            }
            
            else{
                range.location = imageURL.length - 11;
                range.length = 11;
                [imageURL deleteCharactersInRange:range];
                [imageURL insertString:@"bigger.jpeg" atIndex:imageURL.length];
                
                NSLog(@"IMAGE URL (JPEG): %@", imageURL);
            }
            
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.profilePicture.image = [UIImage imageWithData:data];
            });
            
        });
        
    }
    
    
}


#pragma mark -
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    
    self.tweetText.backgroundColor = [UIColor clearColor];
    
    CGRect frame = self.tweetText.frame;
    frame.size.height = self.tweetText.contentSize.height;
    self.tweetText.frame = frame;
    
    CGRect dateFrame = CGRectMake(self.timeTheTweetWasCreated.frame.origin.x, CGRectGetMaxY(self.tweetText.frame) + 10, self.timeTheTweetWasCreated.frame.size.width,self.timeTheTweetWasCreated.frame.size.height);
    self.timeTheTweetWasCreated.frame = dateFrame;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
