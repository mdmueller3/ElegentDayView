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

@interface Tick : UIView

@property LineType lineType;

-(instancetype)initWithFrame:(CGRect)frame lineType:(LineType)type;

@end
