//
//  MasterViewController.h
//  Twitter Search
//
//  Created by Aditya Trivedi on 2013-01-15.
//  Copyright (c) 2013 Aditya Trivedi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController {
    
    NSDictionary* tweets;
    
}



- (void) getTweets;

@end
