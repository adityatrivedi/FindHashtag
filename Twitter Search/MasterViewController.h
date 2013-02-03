//
//  MasterViewController.h
//  Twitter Search
//
//  Created by Aditya Trivedi on 2013-01-15.
//  Copyright (c) 2013 Aditya Trivedi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController {
    
    NSDictionary *tweets;
    
}

@property NSMutableArray *tweetsText;
@property NSMutableArray *tweetsUsername;
@property NSMutableArray *userprofilePictures;
@property NSMutableArray *timeTheTweetWasCreated;
//@property NSMutableArray *tweetsUserID;

- (void) getTweets;

@end
