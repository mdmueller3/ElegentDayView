//
//  ElegantDayView.m
//  ElegantDayView
//
//  Created by Michael Mueller on 11/20/16.
//  Copyright © 2016 Michael Mueller. All rights reserved.
//

#import "ElegantDayView.h"
#import "Tick.h"

@implementation ElegantDayView

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self setup];
}

-(void)setup{
    self.backgroundColor = [UIColor grayColor];
    NSLog(@"frame length: %f", self.frame.size.width);
    Tick *tick = [[Tick alloc] initWithFrame:CGRectMake(100, 100, 300, 100) lineType:LineTypeStraight];
    tick.layer.borderColor = [UIColor redColor].CGColor;
    tick.layer.borderWidth = 1.0;
    [self addSubview:tick];
    
    self.layer.borderWidth = 3.0;
    self.layer.borderColor = [UIColor yellowColor].CGColor;
}

@end
