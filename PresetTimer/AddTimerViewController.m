//
//  AddTimerViewController.m
//  PresetTimer
//
//  Created by Xiulan Shi on 8/26/15.
//  Copyright (c) 2015 Xiulan Shi. All rights reserved.
//

#import "AddTimerViewController.h"
#import "TimerModel.h"

@interface AddTimerViewController ()

@property (nonatomic) TimerModel *model;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveTimer;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UITextField *timerName;
@property (weak, nonatomic) IBOutlet UIDatePicker *selectTime;



@end

@implementation AddTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.model = [[TimerModel alloc] init];
    [self.model initializeModel];
    
    
    //self.selectTime.countDownDuration = 60;
    self.navigationItem.title = @"Add Timer";
    
}

- (void)saveNewTimer{
    
    Timer *newTimer = [[Timer alloc] init];
    
    newTimer.timerName = self.timerName.text;
    
    newTimer.countDownDuration = self.selectTime.countDownDuration;
    
    [self.timerViewController.model.timers insertObject:newTimer atIndex:0];
    
}

- (IBAction)dismissModalView:(id)sender {
    
    [self saveNewTimer];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//- (IBAction)saveButtonTapped:(id)sender {
//    
//    // allocate a new TimerModel
//    // set the name property to time.text
//    // set the time property to selectTime.countDownDuration
//    // add new timer to timerViewController.timers
//    [self.timerViewController.model.timers insertObject:self atIndex:0];
//    [self dismissViewControllerAnimated:YES completion:nil];
//}




- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
