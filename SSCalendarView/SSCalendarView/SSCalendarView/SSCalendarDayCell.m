//
//  SSCalendarDayCell.m
//  SSCalendarView
//
//  Created by muzhi on 2020/4/1.
//  Copyright © 2020 SunSatan. All rights reserved.
//

#import "SSCalendarDayCell.h"

#define kDarkBlueColor [UIColor colorWithRed:40/225.0 green:40/225.0 blue:120/225.0 alpha:1]
#define kBloodRedColor [UIColor colorWithRed:255/225.0 green:30/225.0 blue:50/225.0 alpha:1]

@implementation SSCalendarDayCell

#pragma mark - initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self basicConfigure];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self basicConfigure];
    }
    return self;
}

- (void)basicConfigure
{
    [self loadSelectBackgroundView];
    [self loadDayLabel];
    [self loadDetailLabel];
}

#pragma mark - load subview

- (void)loadSelectBackgroundView
{
    if (_selectBackgroundView) {
        return;
    }
    
    _selectBackgroundView = [[UIView alloc] init];
    [self.contentView addSubview:_selectBackgroundView];
    
    _selectBackgroundView.backgroundColor = [UIColor orangeColor];
    
    _selectBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [_selectBackgroundView.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    [_selectBackgroundView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
    [_selectBackgroundView.widthAnchor   constraintEqualToAnchor:self.contentView.widthAnchor  multiplier:0.9].active = YES;
    [_selectBackgroundView.heightAnchor  constraintEqualToAnchor:self.contentView.heightAnchor multiplier:0.9].active = YES;
}

- (void)loadDayLabel
{
    if (_dayLabel) {
        return;
    }
    
    _dayLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_dayLabel];
    
    _dayLabel.backgroundColor = [UIColor redColor];
    _dayLabel.textAlignment = NSTextAlignmentCenter;
    _dayLabel.font = [UIFont systemFontOfSize:16];
    _dayLabel.textColor = kDarkBlueColor;
    _dayLabel.text = @"20";
    
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = 16;
    CGFloat x = 0;
    CGFloat y = (self.contentView.frame.size.height / 2) - height;
    _dayLabel.frame = CGRectMake(x, y, width, height);
}

- (void)loadDetailLabel
{
    if (_detailLabel) {
        return;
    }
    
    _detailLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_detailLabel];
    
    _detailLabel.backgroundColor = [UIColor greenColor];
    _detailLabel.textAlignment = NSTextAlignmentCenter;
    _detailLabel.font = [UIFont systemFontOfSize:10];
    _detailLabel.textColor = kDarkBlueColor;
    _detailLabel.text = @"十五";
    
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = 12;
    CGFloat x = 0;
    CGFloat y = (self.contentView.frame.size.height / 2);
    _detailLabel.frame = CGRectMake(x, y, width, height);
}

#pragma mark - binding

- (void)binding
{
    
}

@end
