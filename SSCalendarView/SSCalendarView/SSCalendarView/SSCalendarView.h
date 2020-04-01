//
//  SSCalendarView.h
//  SSCalendarView
//
//  Created by muzhi on 2020/4/1.
//  Copyright © 2020 SunSatan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSCalendarView;

@protocol SSCalendarViewDelegate <NSObject>

@required

@optional

@end

@protocol SSCalendarViewDataSource <NSObject>

@required

@optional

- (void)calendarView:(SSCalendarView *)calendarView didChangeCalendarHeight:(CGFloat)height;

- (UIView *)calendarViewForCalendarHeaderView:(SSCalendarView *)calendarView;
- (UIView *)calendarViewForCalendarFooterView:(SSCalendarView *)calendarView;
- (CGFloat)calendarViewForCalendarHeaderViewHeight:(SSCalendarView *)calendarView;
- (CGFloat)calendarViewForCalendarFooterViewHeight:(SSCalendarView *)calendarView;

@end

@interface SSCalendarView : UIView

@property (nonatomic, weak) id<SSCalendarViewDelegate>   delegate;
@property (nonatomic, weak) id<SSCalendarViewDataSource> dataSource;

@property (nonatomic, readwrite) BOOL pagingEnabled;   //默认为no
@property (nonatomic, readwrite) BOOL scrollEnable;    //默认为yes
@property (nonatomic, readwrite) BOOL verticalScroll;  //默认为yes垂直滚动，no则为水平滚动
@property (nonatomic, readwrite) BOOL monthWeekHidden; //默认为no

@property (nonatomic, strong) UIView *calendarHeaderView;
@property (nonatomic, strong) UIView *calendarFooterView;
@property (nonatomic, readwrite) CGFloat calendarHeaderViewHeight; //calendarHeaderViewHeight高度
@property (nonatomic, readwrite) CGFloat calendarFooterViewHeight; //calendarFooterViewHeight高度

- (void)reloadCalendar;

@end

@interface SSCalendarView (DataSource)

@property (nonatomic, strong) NSDate *startMonth;//指定开始月份，默认为当前月
// 限制 startMonth 开始的前后滚动范围
@property (nonatomic, readwrite) NSUInteger beforeMonthCount;  //默认为0，向前无限滚动
@property (nonatomic, readwrite) NSUInteger afterMonthCount; //默认为0，向后无限滚动

@end

NS_ASSUME_NONNULL_END
