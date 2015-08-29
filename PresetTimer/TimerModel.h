//
//  TimerModel.h
//  PresetTimer
//
//  Created by Xiulan Shi on 8/29/15.
//  Copyright (c) 2015 Xiulan Shi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerModel : NSObject

@property (nonatomic) NSMutableArray *timers;

+ (instancetype)sharedInstance;

- (void)initializeModel;


@end
