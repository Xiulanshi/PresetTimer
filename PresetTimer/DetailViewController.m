//
//  DetailViewController.m
//  PresetTimer
//
//  Created by Xiulan Shi on 8/26/15.
//  Copyright (c) 2015 Xiulan Shi. All rights reserved.
//

#import "DetailViewController.h"
#import "Timer.h"
#import "TimerModel.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UIButton *startCancelButton;

@property (weak, nonatomic) IBOutlet UIButton *pauseResumeButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic) BOOL isTimerRunning;
@property (nonatomic) BOOL isPaused;

@property (nonatomic) int hours;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

@property (nonatomic) int secondsCount;

@property (nonatomic) NSTimer *timer;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Detail Timer";
    
    self.nameLabel.text = self.currentTimer.timerName;
    
    self.imageView.image = [UIImage imageNamed:self.currentTimer.timerName];
    
    self.hours = self.currentTimer.countDownDuration/3600;
    self.minutes = (self.currentTimer.countDownDuration % 3600)/60;
    self.seconds = self.currentTimer.countDownDuration - (self.hours * 3600) - (self.minutes * 60);
    
    self.timeLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", self.hours, self.minutes, self.seconds];
    
    self.isTimerRunning = NO;
    self.isPaused = NO;
    self.pauseResumeButton.enabled = NO;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startCancelButton:(id)sender {
    
    NSTimeInterval duration = self.datePicker.countDownDuration;
    
    self.seconds = 0;
    self.hours = (int)(duration/3600.0f);
    self.minutes = ((int)duration - (self.hours * 3600))/60;
    
    self.secondsCount = ((self.hours * 3600) + (self.minutes * 60));
    
    self.timeLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", self.hours, self.minutes, self.seconds];
    
    
    
    if (self.isTimerRunning == YES) {
        
        self.timeLabel.alpha = 0;
        [self.startCancelButton setTitle:@"Start" forState:UIControlStateNormal];
        [self.pauseResumeButton setTitle:@"Pause" forState:UIControlStateNormal];
        self.pauseResumeButton.enabled = NO;
        
        [self.timer invalidate];
        self.timer = nil;
        
    } else {
        
        self.timeLabel.alpha = 1;
        
        [self.startCancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        self.pauseResumeButton.enabled = YES;
        
        if (self.timer == nil) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                          target:self
                                                        selector:@selector(updateTimer)
                                                        userInfo:nil
                                                         repeats:YES];
        }
        
    }
    
    self.isTimerRunning = !self.isTimerRunning;
    
    
}

- (void) updateTimer {
    
    self.secondsCount--;
    
    self.hours = self.secondsCount/3600;
    self.minutes = (self.secondsCount % 3600)/60;
    self.seconds = self.secondsCount - (self.hours * 3600) - (self.minutes * 60);
    
    self.timeLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", self.hours, self.minutes, self.seconds];
    
    
    if (self.secondsCount <= 0) {
        
        [self.timer invalidate];
        self.timer = nil;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time Done!" message:[NSString stringWithFormat:@""] delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
        
        [alert show];
        
        self.timeLabel.alpha = 0;
        [self.startCancelButton setTitle:@"Start" forState:UIControlStateNormal];
        self.pauseResumeButton.enabled = NO;
        
    }
    
}


- (IBAction)pauseResumeButton:(id)sender {
    if (self.isPaused == NO) {
        [self.timer invalidate];
        self.timer = nil;
        
        [self.pauseResumeButton setTitle:@"Resume" forState:UIControlStateNormal];
        
    } else {
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(updateTimer)
                                                    userInfo:nil
                                                     repeats:YES];
        
        [self.pauseResumeButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
    
    self.isPaused = !self.isPaused;
    
}


@end
