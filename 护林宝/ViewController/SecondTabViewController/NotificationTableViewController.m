//
//  NotificationTableViewController.m
//  护林宝
//
//  Created by Apple on 11/24/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "NotificationTableViewController.h"
#import "Notification.h"

@interface NotificationTableViewController ()

@end

@implementation NotificationTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"通知";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新"
                                                                             style: UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(refreshAction)];
    [GlobalResource sharedInstance].notificationContentArray = [Notification MR_findAll];
    //NSLog(@"self.notifArray is %@",[GlobalResource sharedInstance].notificationContentArray);

}

- (void)refreshAction {
    
    [GlobalResource sharedInstance].notificationContentArray = [Notification MR_findAll];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [GlobalResource sharedInstance].notificationContentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Notification * notificationObject = [[GlobalResource sharedInstance].notificationContentArray objectAtIndex:indexPath.row];

    cell.textLabel.text = [NSString stringWithFormat:@"通知: %@",notificationObject.content];

    
    return cell;
}

@end
