//
//  ViewController.m
//  ElegantDayView
//
//  Created by Michael Mueller on 11/20/16.
//  Copyright © 2016 Michael Mueller. All rights reserved.
//

#import "EditingDemo.h"
#import "ElegantDayView.h"

@interface EditingDemo ()

@property (strong, nonatomic) ElegantDayView *dayView;

@end

@implementation EditingDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dayView = [[ElegantDayView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_dayView];
    _dayView.isEditable = YES;
    _dayView.randomEventColors = YES;
    [_dayView goToTime:@"12:30 pm"];
//    Event *sleep = [_dayView addEventWithStartIndex:0 EndIndex:32 Name:@"Sleep"];
//    [sleep setColor:[UIColor grayColor]];
    
//    Event *school = [_dayView addEventWithStartIndex:5 EndIndex:10 Name:@"School"];
//    Event *packerGame = [_dayView addEventWithStartIndex:8 EndIndex:20 Name:@"Packer Game"];
//    [school setColor:[UIColor redColor]];
//    [packerGame setColor:[UIColor greenColor]];
    
//    [_dayView setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
