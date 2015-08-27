//
//  DetailViewController.h
//  PresetTimer
//
//  Created by Xiulan Shi on 8/26/15.
//  Copyright (c) 2015 Xiulan Shi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootTableViewController.h"

@interface DetailViewController : UIViewController

@property (nonatomic) NSString *timerName;

@property (nonatomic) NSTimer *timerTime;

@end
