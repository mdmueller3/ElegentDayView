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

-(instancetype)init{
    self = [super init];
    if(self){
        self.layer.borderWidth = 3.0;
        self.layer.cornerRadius = 5.0;
    }
    return self;
}

-(void)setName:(NSString *)name{
    _name = name;
    _nameLabel.text = name;
}

-(void)setColor:(UIColor *)color{
    _color = color;
    _background.backgroundColor = _color;
    self.layer.borderColor = _color.CGColor;
}

-(void)setupWithFrame:(CGRect)frame{
    self.frame = frame;
    _background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    if(_color == nil){
        _color = [UIColor colorWithRed:0.40 green:0.62 blue:0.86 alpha:1.0];
    }
    _background.backgroundColor = _color;
    _background.layer.cornerRadius = 5.0;
    self.layer.borderColor = _color.CGColor;
    
    _background.alpha = 0.4;
    [self addSubview:_background];
    
    CGFloat tickHeight = self.frame.size.height/(_endIndex-_startIndex);
    
    _nameLabel = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, tickHeight)];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.text = _name;
    _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    _nameLabel.textColor = [UIColor whiteColor];
    [_nameLabel setReturnKeyType:UIReturnKeyDone];
    [_nameLabel addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    [_background addSubview:_nameLabel];
    
    _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width + 5,tickHeight/2-10,20,20)];
    [_deleteButton setImage:[UIImage imageNamed:@"deleteButton"] forState:UIControlStateNormal];
    [_deleteButton addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    [self insertSubview:_deleteButton aboveSubview:_background];
    _deleteButton.hidden = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:tap];
    
//    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
//    [self addGestureRecognizer:swipe];
    
//    UIControl *dragTestView = [UIControl new];
//    dragTestView.backgroundColor = [UIColor grayColor];
//    [self addSubview:dragTestView];
//    [dragTestView addTarget:self action:@selector(handleDragEvent:forEvent:) forControlEvents:UIControlEventTouchDragEnter];
}

-(void)handleTap:(UITapGestureRecognizer*)tapGesture{
    [self startEditing];
}

-(void)changeFrame:(CGRect)frame{
    self.frame = frame;
    _background.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
}

- (void)handleDragEvent:(id)sender forEvent:(UIEvent*)event {
    NSLog(@"drag entered");
}

-(void)swipe:(UISwipeGestureRecognizer*)swipeGesture{
    CGPoint point = [swipeGesture locationInView:self];
    NSLog(@"x: %f y:%f", point.x, point.y);
}

-(void)textFieldFinished:(id)sender{
    _name = _nameLabel.text;
    [self endEditing];
}

-(void)startEditing{
    _editingMode = YES;
    if(_deleteButton.hidden){
        _deleteButton.hidden = NO;
    }
    [_nameLabel becomeFirstResponder];
}

-(void)endEditing{
    _editingMode = NO;
    _deleteButton.hidden = YES;
    [_nameLabel resignFirstResponder];
}

-(void)delete:(id)sender{
    [self removeFromSuperview];
}

@end
