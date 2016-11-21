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

@property CGFloat start;
@property CGFloat end;

@end
