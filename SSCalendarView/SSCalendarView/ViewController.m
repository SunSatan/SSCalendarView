//
//  ViewController.m
//  SSCalendarView
//
//  Created by muzhi on 2020/3/30.
//  Copyright © 2020 SunSatan. All rights reserved.
//

#import "ViewController.h"
#import "SSCalendarWeekView.h"
#import "SSCalendarView.h"

@interface ViewController ()

@property (nonatomic, strong) SSCalendarView *calendarView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    NSLog(@"---");
    
    self.calendarView = [[SSCalendarView alloc] init];
    [self.view addSubview:self.calendarView];
    
    self.calendarView.frame = CGRectMake(0, 100, 375, 300);
    self.calendarView.calendarHeaderViewHeight = 20;
    self.calendarView.calendarFooterViewHeight = 20;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.calendarView.calendarFooterViewHeight = 10;
}


@end
