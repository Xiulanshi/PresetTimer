//
//  RootTableViewController.h
//  PresetTimer
//
//  Created by Xiulan Shi on 8/26/15.
//  Copyright (c) 2015 Xiulan Shi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Timer.h"
#import "TimerModel.h"

@interface RootTableViewController : UITableViewController

@property (nonatomic)TimerModel *model;

//@property (strong, nonatomic) NSMutableArray *timers;

@end
