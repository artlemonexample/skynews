//
//  LSCategoriesViewController.m
//  SkyNews
//
//  Created by aleksandr on 24.05.17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "LSCategoriesViewController.h"
#import "LSCategory.h"
#import "LSNewsListViewController.h"

@interface LSCategoriesViewController ()

@property (strong) NSArray *categories;

@end

@implementation LSCategoriesViewController
        
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSMutableArray* categoriesArray = [NSMutableArray array];
    
    LSCategory* home = [LSCategory new];
    LSCategory* business = [LSCategory new];
    LSCategory* politics = [LSCategory new];
    LSCategory* technology = [LSCategory new];
    
    home.title = @"Home";
    business.title = @"Business";
    politics.title = @"Politics";
    technology.title = @"Technology";
    
    home.link = @"http://feeds.skynews.com/feeds/rss/home.xml";
    business.link = @"http://feeds.skynews.com/feeds/rss/business.xml";
    politics.link = @"http://feeds.skynews.com/feeds/rss/politics.xml";
    technology.link = @"http://feeds.skynews.com/feeds/rss/technology.xml";

    [categoriesArray addObject:home];
    [categoriesArray addObject:business];
    [categoriesArray addObject:politics];
    [categoriesArray addObject:technology];

    self.categories = categoriesArray.copy;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.categories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryCell" forIndexPath:indexPath];
    
    LSCategory* cellModel = [self.categories objectAtIndex:indexPath.row];
    cell.textLabel.text = cellModel.title;

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    LSNewsListViewController* listViewControl = [segue destinationViewController];
    
    NSIndexPath* i = [self.tableView indexPathForCell:sender];
    LSCategory *category = [self.categories objectAtIndex:i.row];
    listViewControl.category = category;
}

@end
