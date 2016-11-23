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

-(instancetype)initWithName:(NSString *)name{
    self = [super init];
    if(self){
        self.layer.borderWidth = 3.0;
        self.layer.cornerRadius = 5.0;
        self.layer.borderColor = [UIColor colorWithRed:0.40 green:0.62 blue:0.86 alpha:1.0].CGColor;
        _name = name;
    }
    return self;
}

-(void)setupWithFrame:(CGRect)frame{
    self.frame = frame;
    UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    background.backgroundColor = [UIColor colorWithRed:0.40 green:0.62 blue:0.86 alpha:1.0];
    background.alpha = 0.4;
    [self addSubview:background];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/(_endIndex-_startIndex))];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.text = _name;
    _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    _nameLabel.textColor = [UIColor whiteColor];
    [background addSubview:_nameLabel];
}

//-(instancetype)initWithFrame:(CGRect)frame Name:(NSString *)name{
//    self = [super initWithFrame:frame];
//    if(self){
//        if(_endIndex <= _startIndex){
//            return self;
//        }
//        self.layer.borderWidth = 3.0;
//        self.layer.cornerRadius = 5.0;
//        self.layer.borderColor = [UIColor colorWithRed:0.40 green:0.62 blue:0.86 alpha:1.0].CGColor;
//        
//        UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//        background.backgroundColor = [UIColor colorWithRed:0.40 green:0.62 blue:0.86 alpha:1.0];
//        background.alpha = 0.4;
//        [self addSubview:background];
//        
//        _name = name;
//        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/(_endIndex-_startIndex))];
//        _nameLabel.textAlignment = NSTextAlignmentCenter;
//        _nameLabel.text = _name;
//        _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
//        _nameLabel.textColor = [UIColor whiteColor];
//        [background addSubview:_nameLabel];
//        
//    }
//    return self;
//}

@end
