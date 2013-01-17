//
//  MasterViewController.m
//  Twitter Search
//
//  Created by Aditya Trivedi on 2013-01-15.
//  Copyright (c) 2013 Aditya Trivedi. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
    // Holds all tweets with individual tweets in the form of a NSDictionary, located at individual indices 
    NSArray *results;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [self getTweets];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"TweetCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    // If no cells exist then create them
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    
    // Assigning cell labels the tweet text and the associated username
    cell.textLabel.text = [self.tweetsText objectAtIndex: [indexPath row]];
    cell.detailTextLabel.text = [self.tweetsUsername objectAtIndex:[indexPath row]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}


#pragma mark - custom methods

- (void) getTweets {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //Returns a JSON data object containing the data from the location specified by the URL.
        NSData *tweetdata = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://search.twitter.com/search.json?q=DaveMustaine&rpp=100"]];
        
        NSError *parseError = nil;
        
        // Using the NSJSONSerialization class to convert JSON to Foundation objects and vice versa
        // JSONObjectWithData returns Foundation object from given JSON data
        // Foundation Objects formed are stored in the "tweets" Dictionary which is a Dictionary of Dictionaries
        tweets = [NSJSONSerialization JSONObjectWithData:tweetdata
                                      options:kNilOptions
                                      error:&parseError];
        
        results = [tweets objectForKey:@"results"];
        
        // Print all raw tweets into console
        for (int i = 0; i < [results count]; i ++) {
            NSLog(@"Contents of Tweet# %d are %@",i, [results objectAtIndex:i]);
        }
        
        // Initializing our properties
        self.tweetsText = [[NSMutableArray alloc]init];
        self.tweetsUsername = [[NSMutableArray alloc] init];
        
        // Filling in the info regarding tweets by iterating through "results"
        for (NSDictionary *dictionary in results) {
            
            [self.tweetsText addObject:[dictionary objectForKey:@"text"]];
            [self.tweetsUsername addObject:[dictionary objectForKey:@"from_user"]];
        }
        
        // Update the tableview in the main thread after the JSON data fetch is completed
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView reloadData];
            
        });
        
        
    });
    
}

@end
