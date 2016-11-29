//
//  ElegantDayView.h
//  ElegantDayView
//
//  Created by Michael Mueller on 11/20/16.
//  Copyright © 2016 Michael Mueller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface ElegantDayView : UIScrollView

@property BOOL isEditable;
@property BOOL randomEventColors;

@property (strong, nonatomic) NSMutableArray *ticks;
@property (strong, nonatomic) NSArray *tickTimes;
@property (strong, nonatomic) NSArray *times;
@property (strong, nonatomic) NSMutableArray *events;

@property int lastRandom;

// Used randomly if randomEventColors enabled
@property (strong, nonatomic) NSArray *eventColors;

@property CGPoint startPoint;
@property CGPoint currentPoint;
@property (strong, nonatomic) Event *currentEvent;

@property UIFont *labelFont;

@property int numTicks;
@property int tickHeight;
@property (strong, nonatomic) UIFont *font;


-(void)addEvents:(NSArray*)events;
-(void)setFont:(UIFont*)font;
-(void)goToTime:(NSString *)time;
-(void)checkForSameNames:(Event *)addedEvent;
-(void)addEventWithStartIndex:(int)startIndex EndIndex:(int)endIndex Name:(NSString *)name;

@end
