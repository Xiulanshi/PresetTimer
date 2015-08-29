//
//  RootTableViewController.m
//  PresetTimer
//
//  Created by Xiulan Shi on 8/26/15.
//  Copyright (c) 2015 Xiulan Shi. All rights reserved.
//

#import "RootTableViewController.h"
#import "DetailViewController.h"
#import "AddTimerViewController.h"


@interface RootTableViewController ()

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [TimerModel sharedInstance];
    [self.model initializeModel];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"Preset Timers";
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.model.timers removeObjectAtIndex:indexPath.row];
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
    return [self.model.timers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    Timer *timer = [self.model.timers objectAtIndex:indexPath.row];
    
    cell.textLabel.text = timer.timerName;
    
    int minutes = timer.countDownDuration/60;
  
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i Mins", minutes];
    cell.imageView.image = [UIImage imageNamed:timer.timerName];
    
    [cell layoutIfNeeded];
    return cell;
    
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqual:@"showAdd"]) {
        // get the destination view controller from the segue
        // set the timerViewController property on the destination
        // view controller to `self`
        UINavigationController *navigationController = segue.destinationViewController;
        
        AddTimerViewController *addVC = navigationController.viewControllers[0];
        
        addVC.timerViewController = self;
        
        
    }
    else{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSString *currentTimer = [self.model.timers objectAtIndex:indexPath.row];
    DetailViewController *detailVC = segue.destinationViewController;
        
    detailVC.currentTimer = currentTimer;
        
    }
    
}

@end
