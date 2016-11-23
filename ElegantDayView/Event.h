//
//  Event.h
//  ElegantDayView
//
//  Created by Michael Mueller on 11/20/16.
//  Copyright © 2016 Michael Mueller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Event : UIView

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UILabel *nameLabel;

// Both out of 96 (24 * 4 -- # of 15 min intervals in 24 hours)
@property int startIndex;
@property int endIndex;

-(instancetype)initWithFrame:(CGRect)frame Start:(int)startIndex End:(int)endIndex Name:(NSString *)name;

@end
