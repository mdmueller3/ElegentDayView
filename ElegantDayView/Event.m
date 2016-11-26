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
}

-(void)setupWithFrame:(CGRect)frame{
    self.frame = frame;
    _background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    
    _color = [UIColor colorWithRed:0.40 green:0.62 blue:0.86 alpha:1.0];
    _background.backgroundColor = _color;
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
    
    _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(5,tickHeight/2-10,20,20)];
    [_deleteButton setImage:[UIImage imageNamed:@"deleteButton"] forState:UIControlStateNormal];
    [_deleteButton addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    [self insertSubview:_deleteButton aboveSubview:_background];
    _deleteButton.hidden = YES;
    
    _upButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 10, -10, 20, 20)];
    [_upButton setTitle:@"" forState:UIControlStateNormal];
    _upButton.backgroundColor = _color;
    _upButton.layer.cornerRadius = 10;
    [self insertSubview:_upButton aboveSubview:_background];
    _upButton.hidden = YES;
    
    _downButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 10, self.frame.size.height-10, 20, 20)];
    [_downButton setTitle:@"" forState:UIControlStateNormal];
    _downButton.backgroundColor = _color;
    _downButton.layer.cornerRadius = 10;
    [self insertSubview:_downButton aboveSubview:_background];
    _downButton.hidden = YES;
    
//    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
//    [self addGestureRecognizer:swipe];
    
//    UIControl *dragTestView = [UIControl new];
//    dragTestView.backgroundColor = [UIColor grayColor];
//    [self addSubview:dragTestView];
//    [dragTestView addTarget:self action:@selector(handleDragEvent:forEvent:) forControlEvents:UIControlEventTouchDragEnter];


}

-(void)changeFrame:(CGRect)frame{
    self.frame = frame;
    _background.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
//    _upButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 10, -10, 20, 20)];
    _upButton.frame = CGRectMake(frame.size.width/2 - 10, -10, 20, 20);
    _downButton.frame = CGRectMake(frame.size.width/2 - 10, frame.size.height-10, 20, 20);
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
    _editingMode = NO;
    _deleteButton.hidden = YES;
    _upButton.hidden = YES;
    _downButton.hidden = YES;
    [_nameLabel resignFirstResponder];
}

-(void)editMode{
    if(_deleteButton.hidden){
        _deleteButton.hidden = NO;
        _upButton.hidden = NO;
        _downButton.hidden = NO;
    }
}

-(void)delete:(id)sender{
    [self removeFromSuperview];
}

@end
