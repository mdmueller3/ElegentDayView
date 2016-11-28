//
//  Tick.m
//  ElegantDayView
//
//  Created by Michael Mueller on 11/20/16.
//  Copyright © 2016 Michael Mueller. All rights reserved.
//

#import "Tick.h"


@interface Tick()

@property (strong, nonatomic) CAShapeLayer *line;

@end

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
        _line = [CAShapeLayer layer];
        UIBezierPath *linePath=[UIBezierPath bezierPath];
        _lineStart = CGPointMake(frame.origin.x+40, 0);
        _lineEnd = CGPointMake(frame.size.width, 0);
        _line.lineWidth = 2.0;
        [linePath moveToPoint: _lineStart];
        [linePath addLineToPoint: _lineEnd];
        _line.path=linePath.CGPath;
        _line.fillColor = nil;
        _line.opacity = 1.0;
        _line.strokeColor = [UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.0].CGColor;
        
        if(type == LineTypeDashed){
            [_line setLineDashPattern:
             [NSArray arrayWithObjects:[NSNumber numberWithInt:5],
              [NSNumber numberWithInt:4],nil]];
        }
        [self.layer addSublayer:_line];
    }
    
    return self;
}

-(void)setFont:(UIFont *)font{
    if(_labelSize == LabelSizeSmall){
        [_label setFont:[UIFont fontWithName:font.fontName size:font.pointSize-2]];
    } else {
        [_label setFont:font];
    }
}

-(void)createLabelWithTime:(NSString *)timeLabel size:(LabelSize)size{
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, -13, 70, 20)];
    _label.text = timeLabel;
    _label.textAlignment = NSTextAlignmentRight;
    _timeLabel = timeLabel;
    if(size == LabelSizeLarge){
        _label.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        _label.textColor = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1.0];
    } else {
        _label.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        _label.textColor = [UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1.0];
    }
    [self addSubview:_label];
}

//-(NSString *)convertToStringFromNumber:(NSNumber *)number{
//    NSString *tod;
//    NSNumber *time;
//    if([number floatValue] > 12.00){
//        time = [NSNumber numberWithFloat:[number floatValue] - 12];
//        tod = @"pm";
//    } else {
//        tod = @"am";
//    }
//    
//    
//}

@end
