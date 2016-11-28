//
//  ElegantDayView.h
//  ElegantDayView
//
//  Created by Michael Mueller on 11/20/16.
//  Copyright © 2016 Michael Mueller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ElegantDayView : UIScrollView

@property BOOL isEditable;

-(void)addEvents:(NSArray*)events;
-(void)setFont:(UIFont*)font;
-(void)setPrimaryTimeColor:(UIColor*)color;
-(void)setSecondaryTimeColor:(UIColor*)color;

@end
