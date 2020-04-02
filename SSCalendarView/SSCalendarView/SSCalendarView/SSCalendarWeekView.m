//
//  SSCalendarWeekView.m
//  SSCalendarView
//
//  Created by muzhi on 2020/3/31.
//  Copyright © 2020 SunSatan. All rights reserved.
//

#import "SSCalendarWeekView.h"

static NSInteger const kWeekLabelFontSize = 12.0;

@interface SSCalendarWeekView ()

@property (nonatomic, readwrite) NSUInteger saturday; //1-7
@property (nonatomic, readwrite) NSUInteger sunday;   //1-7

@end

@implementation SSCalendarWeekView

#pragma mark - initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self basicConfigure];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self basicConfigure];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self reloadWeekView];
}

#pragma mark - configuration

- (void)basicConfigure
{
    self.backgroundColor = [UIColor whiteColor];
    _saturday = 7;
    _sunday = 1;
    _weekdayColor = [UIColor blackColor];
    _weekendColor = [UIColor redColor];
}

#pragma mark - reload subview

- (void)reloadWeekView
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat labelWidth = self.frame.size.width / self.weekArray.count * 1.0;
    CGFloat labelHeight = self.frame.size.height;
    for (NSInteger weekday = 1; weekday <= self.weekArray.count; weekday++) {
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.frame = CGRectMake(labelWidth * (weekday - 1), 0, labelWidth, labelHeight);
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:kWeekLabelFontSize];
        label.textColor = self.weekdayColor;
        if (weekday == self.saturday || weekday == self.sunday) {
            label.textColor = self.weekendColor;
        }
        label.text = self.weekArray[(weekday - 1)];
        
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(calendarWeekView:weekLabel:weekday:)]) {
            [self.dataSource calendarWeekView:self weekLabel:label weekday:weekday];
        }
    }
}

#pragma mark - setting

- (void)setWeekMode:(SSCalendarWeekMode)weekMode
{
    _weekMode = weekMode;
    
    if (_weekArray) {
        return;
    }
    if (_weekMode == SSCalendarWeekModeDefault) {
        _saturday = 7;
        _sunday = 1;
    }
    else if (_weekMode == SSCalendarWeekModeUsually) {
        _saturday = 6;
        _sunday = 7;
    }
}

- (void)setSaturday:(NSUInteger)saturday sunday:(NSUInteger)sunday
{
    if (!_weekArray) {
        return;
    }
    self.saturday = saturday;
    self.sunday = sunday;
}

#pragma mark - lazy load

- (NSArray<NSString *> *)weekArray
{
    if (_weekArray) {
        return _weekArray;
    }
    if (self.weekMode == SSCalendarWeekModeUsually) {
        return [self SSCalendarDefaultWeekArray];
    }
    return [self SSCalendarUsuallyWeekArray];
}

- (NSArray *)SSCalendarDefaultWeekArray
{
    return @[@"SUN 日", @"MON 一", @"TUE 二", @"WED 三", @"THU 四", @"FRI 五", @"SAT 六"];
}

- (NSArray *)SSCalendarUsuallyWeekArray
{
    return @[@"MON 一", @"TUE 二", @"WED 三", @"THU 四", @"FRI 五", @"SAT 六", @"SUN 日"];
}

@end
