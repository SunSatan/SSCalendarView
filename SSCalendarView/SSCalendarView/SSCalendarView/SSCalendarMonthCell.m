//
//  SSCalendarMonthCell.m
//  SSCalendarView
//
//  Created by muzhi on 2020/4/1.
//  Copyright © 2020 SunSatan. All rights reserved.
//

#import "SSCalendarMonthCell.h"
#import "SSCalendarWeekView.h"

@interface SSCalendarMonthCell ()

@property (nonatomic, strong) UIView *monthHeaderView;
@property (nonatomic, strong) UIView *monthFooterView;
@property (nonatomic, strong) SSCalendarWeekView *weekView;
@property (nonatomic, strong) UICollectionView *dayCollectionView;

@end

@implementation SSCalendarMonthCell

#pragma mark - initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)basicConfigure
{
    
}

- (void)layoutSubviews
{
    
}

- (void)loadMonthHeaderView
{
    if (self.monthHeaderView) {
        return;
    }
    
}

- (void)loadMonthFooterView
{
    
}

@end
