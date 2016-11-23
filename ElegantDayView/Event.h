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
@property (strong, nonatomic) UITextField *nameLabel;
@property (strong, nonatomic) UIButton *deleteButton;
@property (strong, nonatomic) UIButton *upButton;
@property (strong, nonatomic) UIButton *downButton;
@property BOOL editingMode;

// Both out of 96 (24 * 4 -- # of 15 min intervals in 24 hours)
@property int startIndex;
@property int endIndex;

@property (strong, nonatomic) UIColor *color;

-(instancetype)initWithName:(NSString *)name;
-(void)setupWithFrame:(CGRect)frame;
-(void)editMode;
-(void)setName:(NSString *)name;

@end
