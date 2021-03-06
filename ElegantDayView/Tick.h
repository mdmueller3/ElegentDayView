//
//  Tick.h
//  ElegantDayView
//
//  Created by Michael Mueller on 11/20/16.
//  Copyright © 2016 Michael Mueller. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    LineTypeStraight,
    LineTypeDashed
} LineType;

typedef enum{
    LabelSizeLarge,
    LabelSizeSmall
} LabelSize;

@interface Tick : UIView

@property LineType lineType;
@property LabelSize labelSize;
@property (strong, nonatomic) UILabel *label;
@property NSString *timeLabel;
@property int index;

@property CGPoint lineStart;
@property CGPoint lineEnd;

-(instancetype)initWithFrame:(CGRect)frame lineType:(LineType)type;

-(void)createLabelWithTime:(NSString *)timeLabel size:(LabelSize)size;

-(void)setFont:(UIFont *)font;

@end
