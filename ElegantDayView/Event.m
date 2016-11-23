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
    UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    background.backgroundColor = [UIColor colorWithRed:0.40 green:0.62 blue:0.86 alpha:1.0];
    self.layer.borderColor = [UIColor colorWithRed:0.40 green:0.62 blue:0.86 alpha:1.0].CGColor;
    
    background.alpha = 0.4;
    [self addSubview:background];
    
    _nameLabel = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/(_endIndex-_startIndex))];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.text = _name;
    _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    _nameLabel.textColor = [UIColor whiteColor];
    [_nameLabel setReturnKeyType:UIReturnKeyDone];
    [_nameLabel addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    [background addSubview:_nameLabel];
    
    _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(5,5,20,20)];
    [_deleteButton setImage:[UIImage imageNamed:@"deleteButton"] forState:UIControlStateNormal];
    [_deleteButton addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    [self insertSubview:_deleteButton aboveSubview:background];
    _deleteButton.hidden = YES;
    
    
}

-(void)textFieldFinished:(id)sender{
    _name = _nameLabel.text;
    [_nameLabel resignFirstResponder];
}

-(void)editMode{
    if(_deleteButton.hidden){
        _deleteButton.hidden = NO;
    } else {
        _deleteButton.hidden = YES;
    }
}

-(void)delete:(id)sender{
    [self removeFromSuperview];
}

@end
