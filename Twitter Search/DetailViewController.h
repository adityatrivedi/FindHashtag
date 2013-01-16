//
//  DetailViewController.h
//  Twitter Search
//
//  Created by Aditya Trivedi on 2013-01-15.
//  Copyright (c) 2013 Aditya Trivedi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
