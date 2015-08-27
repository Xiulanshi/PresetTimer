//
//  RootTableViewController.m
//  PresetTimer
//
//  Created by Xiulan Shi on 8/26/15.
//  Copyright (c) 2015 Xiulan Shi. All rights reserved.
//

#import "RootTableViewController.h"
#import "DetailViewController.h"

@interface RootTableViewController ()

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timers = [[NSMutableArray alloc] init];
    [self.timers addObject:@"ONE"];
    [self.timers addObject:@"TWO"];
    [self.timers addObject:@"THREE"];
    [self.timers addObject:@"FOUR"];
    [self.timers addObject:@"FIVE"];
    
    self.title = @"Timers";
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.timers removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.timers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.timers objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"60";
    //[cell layoutIfNeeded];

    return cell;
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqual:@"showAdd"]) {
        //
    }
    else{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    NSString *currentTimer = [self.timers objectAtIndex:indexPath.row];
    
    NSString *time = @"60";
    
    DetailViewController *detailVC = segue.destinationViewController;
    
    detailVC.timerName = currentTimer;
    detailVC.timerTime = time;
        
    }
    


}

@end
