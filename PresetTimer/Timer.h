//
//  Timer.h
//  PresetTimer
//
//  Created by Xiulan Shi on 8/29/15.
//  Copyright (c) 2015 Xiulan Shi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timer : NSObject

// property for name (NSString *)
@property (nonatomic) NSString *timerName;

// property for time (NSTimeInterval)
@property (nonatomic) NSTimeInterval totalTime;

@property (nonatomic) int countDownDuration;

@end
