//
//  Event.m
//  ElegantDayView
//
//  Created by Michael Mueller on 11/20/16.
//  Copyright © 2016 Michael Mueller. All rights reserved.
//

#import "Event.h"

@implementation Event

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame Start:(int)startIndex End:(int)endIndex{
    self = [super initWithFrame:frame];
    if(self){
        
        _startIndex = startIndex;
        _endIndex = endIndex;
        self.layer.borderWidth = 3.0;
        self.layer.cornerRadius = 5.0;
        self.layer.borderColor = [UIColor colorWithRed:0.40 green:0.62 blue:0.86 alpha:1.0].CGColor;
        
        UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        background.backgroundColor = [UIColor colorWithRed:0.40 green:0.62 blue:0.86 alpha:1.0];
        background.alpha = 0.4;
        [self addSubview:background];
        
    }
    return self;
}

@end
