//
//  Event.h
//  ElegantDayView
//
//  Created by Michael Mueller on 11/20/16.
//  Copyright © 2016 Michael Mueller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Event : UIView <UITextFieldDelegate>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UITextField *nameLabel;
@property (strong, nonatomic) UIButton *deleteButton;
@property (strong, nonatomic) UIView *background;

@property BOOL editingMode;

@property (strong, nonatomic) UIFont *font;

// Both out of 96 (24 * 4 -- # of 15 min intervals in 24 hours)
@property int startIndex;
@property int endIndex;

@property (strong, nonatomic) UIColor *color;

-(void)setupWithFrame:(CGRect)frame;
-(void)startEditing;
-(void)endEditing;
-(void)setName:(NSString *)name;
-(void)setColor:(UIColor *)color;
-(void)changeFrame:(CGRect)frame;

@end
