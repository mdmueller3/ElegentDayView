//
//  ElegantDayView.m
//  ElegantDayView
//
//  Created by Michael Mueller on 11/20/16.
//  Copyright © 2016 Michael Mueller. All rights reserved.
//

#import "ElegantDayView.h"
#import "Tick.h"
#import "Event.h"

@interface ElegantDayView()

@property (strong, nonatomic) NSMutableArray *ticks;
@property (strong, nonatomic) NSArray *tickTimes;
@property (strong, nonatomic) NSArray *times;

@property int numTicks;
@property int tickHeight;

@end



@implementation ElegantDayView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if(self){
        [self setup];
    }
    
    return self;
}

-(void)setup{
    
    _numTicks = 96;
    _tickHeight = 35;
    self.contentSize = CGSizeMake(self.frame.size.width, 1000);
    
    [self createTickTimes];
    [self createTicks];
    
    
    [self addEvents:nil];

}

-(void)createTickTimes{
    _tickTimes = @[@"12:00 am",@"12:30 am",@"1:00 am", @"1:30 am", @"2:00 am", @"2:30 am", @"3:00 am", @"3:30 am", @"4:00 am", @"4:30 am", @"5:00 am", @"5:30 am", @"6:00 am", @"6:30 am", @"7:00 am", @"7:30 am", @"8:00 am", @"8:30 am", @"9:00 am", @"9:30 am", @"10:00 am", @"10:30 am", @"11:00 am", @"11:30 am", @"12:00 pm", @"12:30 pm", @"1:00 pm", @"1:30 pm", @"2:00 pm", @"2:30 pm", @"3:00 pm", @"3:30 pm", @"4:00 pm", @"4:30 pm", @"5:00 pm", @"5:30 pm", @"6:00 pm", @"6:30 pm", @"7:00 pm", @"7:30 pm", @"8:00 pm", @"8:30 pm", @"9:00 pm", @"9:30 pm", @"10:00 pm", @"10:30 pm", @"11:00 pm", @"11:30 pm"];
}

-(void)createTicks{
    // if i = even, create tick with label
    // if i = odd, just create tick
    int i = 0;
    int labelNum = 0; // index num (if even, create large text. if odd, create small text)
    
    if(!_ticks){
        _ticks = [[NSMutableArray alloc] init];
    }
    
    Tick *lastTick;
    
    CGFloat nextY = 0.0;
    
    while(i < _numTicks){
        Tick *tick;
        
        if(!lastTick){
            nextY = 100;
        } else {
            nextY = lastTick.frame.origin.y + lastTick.frame.size.height;
        }
        
        if(i % 4 == 0){
            tick = [[Tick alloc] initWithFrame:CGRectMake(45, nextY, self.frame.size.width - 90, _tickHeight) lineType:LineTypeStraight];
        } else {
            tick = [[Tick alloc] initWithFrame:CGRectMake(45, nextY, self.frame.size.width - 90,_tickHeight) lineType:LineTypeDashed];
        }
        
        [self addSubview:tick];
        [_ticks addObject:tick];
        
        lastTick = tick;
        
        if(i % 2 == 0){
            // create tick with label
            if(labelNum % 2 == 0){
                [tick createLabelWithTime:[_tickTimes objectAtIndex:labelNum] size:LabelSizeLarge];
            } else {
                [tick createLabelWithTime:[_tickTimes objectAtIndex:labelNum] size:LabelSizeSmall];
            }
            labelNum++;
        }
        
        i++;
        
        tick.index = i;
        
    }
    Tick *tick = [[Tick alloc] initWithFrame:CGRectMake(45, nextY, self.frame.size.width - 90, _tickHeight) lineType:LineTypeDashed];
    [self addSubview:tick];
    [_ticks addObject:tick];
    nextY = tick.frame.origin.y + tick.frame.size.height;
    // Add 12:00 am to the bottom
    Tick *finalTick = [[Tick alloc] initWithFrame:CGRectMake(45, nextY, self.frame.size.width - 90, _tickHeight) lineType:LineTypeStraight];
    [self addSubview:finalTick];
    [_ticks addObject:finalTick];
    [finalTick createLabelWithTime:@"12:00 am" size:LabelSizeLarge];
    self.contentSize = CGSizeMake(self.frame.size.width, finalTick.frame.origin.y + finalTick.frame.size.height + 20);
}

-(CGFloat)getHeightFromStartIndex:(int)start EndIndex:(int)end{
    return (end-start)*_tickHeight;
}

-(void)addEvents:(NSArray*)events{

    Tick *selectedTick = [_ticks objectAtIndex:5];
    NSLog(@"x: %f, y: %f, width: %f, height: %f", selectedTick.frame.origin.x, selectedTick.frame.origin.y, selectedTick.frame.size.width, selectedTick.frame.size.height);
    
    int start = 5;
    int end = 10;
    CGRect frame = CGRectMake((selectedTick.lineStart.x+45) + 25, selectedTick.frame.origin.y, (selectedTick.lineEnd.x - selectedTick.lineStart.x) - 50, [self getHeightFromStartIndex:start EndIndex:end]);
    Event *firstEvent = [[Event alloc] initWithFrame:frame Start:start End:end];
    [self addSubview:firstEvent];
    
}

@end
