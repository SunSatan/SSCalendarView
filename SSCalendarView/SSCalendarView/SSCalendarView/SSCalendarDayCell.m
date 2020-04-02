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
    [self loadTopLabel];
    [self loadDayLabel];
    [self loadDetailLabel];
    [self loadDot];
    self.clipsToBounds = YES;
}

#pragma mark - load subview

- (void)loadSelectBackgroundView
{
    if (_selectBackgroundView) {
        return;
    }
    
    _selectBackgroundView = [[UIView alloc] init];
    [self.contentView addSubview:_selectBackgroundView];
    
    _selectBackgroundView.layer.cornerRadius = 5;
    _selectBackgroundView.clipsToBounds = YES;
    
    _selectBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [_selectBackgroundView.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    [_selectBackgroundView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
    [_selectBackgroundView.widthAnchor   constraintEqualToAnchor:self.contentView.widthAnchor  multiplier:0.98].active = YES;
    [_selectBackgroundView.heightAnchor  constraintEqualToAnchor:self.contentView.heightAnchor multiplier:0.98].active = YES;
}

- (void)loadTopLabel
{
    if (_topLabel) {
        return;
    }
    
    _topLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_topLabel];
    
    _topLabel.textAlignment = NSTextAlignmentCenter;
    _topLabel.font = [UIFont systemFontOfSize:10];
    _topLabel.textColor = [UIColor blackColor];
    _topLabel.text = @"清明节";
    
    _topLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_topLabel.topAnchor    constraintEqualToAnchor:_selectBackgroundView.topAnchor constant:4].active = YES;
    [_topLabel.leftAnchor   constraintEqualToAnchor:_selectBackgroundView.leftAnchor].active = YES;
    [_topLabel.rightAnchor  constraintEqualToAnchor:_selectBackgroundView.rightAnchor].active = YES;
    [_topLabel.heightAnchor constraintEqualToConstant:8].active = YES;
}

- (void)loadDayLabel
{
    if (_dayLabel) {
        return;
    }
    
    _dayLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_dayLabel];
    
    _dayLabel.textAlignment = NSTextAlignmentCenter;
    _dayLabel.font = [UIFont systemFontOfSize:16];
    _topLabel.adjustsFontSizeToFitWidth = YES;
    _dayLabel.textColor = [UIColor blackColor];
    _dayLabel.text = @"20";
    
    _dayLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_dayLabel.topAnchor    constraintEqualToAnchor:_topLabel.bottomAnchor constant:2].active = YES;
    [_dayLabel.leftAnchor   constraintEqualToAnchor:_selectBackgroundView.leftAnchor].active = YES;
    [_dayLabel.rightAnchor  constraintEqualToAnchor:_selectBackgroundView.rightAnchor].active = YES;
    [_dayLabel.heightAnchor constraintEqualToConstant:14].active = YES;
    
}

- (void)loadDetailLabel
{
    if (_detailLabel) {
        return;
    }
    
    _detailLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_detailLabel];
    
    _detailLabel.textAlignment = NSTextAlignmentCenter;
    _detailLabel.font = [UIFont systemFontOfSize:10];
    _topLabel.adjustsFontSizeToFitWidth = YES;
    _detailLabel.textColor = [UIColor blackColor];
    _detailLabel.text = @"十五";
    
    _detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_detailLabel.topAnchor    constraintEqualToAnchor:_dayLabel.bottomAnchor constant:2].active = YES;
    [_detailLabel.leftAnchor   constraintEqualToAnchor:_selectBackgroundView.leftAnchor].active = YES;
    [_detailLabel.rightAnchor  constraintEqualToAnchor:_selectBackgroundView.rightAnchor].active = YES;
    [_detailLabel.heightAnchor constraintEqualToConstant:8].active = YES;
}

- (void)loadDot
{
    if (_dot) {
        return;
    }
    
    _dot = [[UIView alloc] init];
    [self.contentView addSubview:_dot];
    
    _dot.layer.cornerRadius = 4;
    _dot.clipsToBounds = YES;
    
    _dot.translatesAutoresizingMaskIntoConstraints = NO;
    [_dot.topAnchor     constraintEqualToAnchor:_detailLabel.bottomAnchor constant:1].active = YES;
    [_dot.centerXAnchor constraintEqualToAnchor:_selectBackgroundView.centerXAnchor].active = YES;
    [_dot.widthAnchor   constraintEqualToConstant:8].active = YES;
    [_dot.heightAnchor  constraintEqualToConstant:8].active = YES;
}

@end
