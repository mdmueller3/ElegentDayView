//
//  Tick.m
//  ElegantDayView
//
//  Created by Michael Mueller on 11/20/16.
//  Copyright © 2016 Michael Mueller. All rights reserved.
//

#import "Tick.h"

@implementation Tick

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame lineType:(LineType)type{
    self = [super initWithFrame:frame];
    
    if(self){
        if(type == LineTypeDashed){
            
        } else {
            CAShapeLayer *line = [CAShapeLayer layer];
            UIBezierPath *linePath=[UIBezierPath bezierPath];
            CGPoint start = CGPointMake(frame.origin.x, 0);
            CGPoint end = CGPointMake(frame.size.width, 0);
            line.lineWidth = 3.0;
            [linePath moveToPoint: start];
            [linePath addLineToPoint:end];
            line.path=linePath.CGPath;
            line.fillColor = nil;
            line.opacity = 1.0;
            line.strokeColor = [UIColor blackColor].CGColor;
            [self.layer addSublayer:line];
        }
    }
    
    return self;
}



@end
