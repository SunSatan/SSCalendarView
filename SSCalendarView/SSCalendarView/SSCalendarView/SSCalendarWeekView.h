//
//  SSCalendarWeekView.h
//  SSCalendarView
//
//  Created by muzhi on 2020/3/31.
//  Copyright © 2020 SunSatan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSCalendarWeekView;

typedef NS_ENUM(NSInteger, SSCalendarWeekMode) {
    SSCalendarWeekModeDefault, //The beginning of the week is Sunday
    SSCalendarWeekModeUsually  //The beginning of the week is Monday
};

@protocol SSCalendarWeekViewDataSource <NSObject>

@optional

//用于外部定制 weekLabel 样式
- (void)calendarWeekView:(SSCalendarWeekView *)calendarWeekView weekLabel:(UILabel *)weekLabel weekday:(NSInteger)weekday;

@end

@interface SSCalendarWeekView : UIView
@property (nonatomic, weak) id<SSCalendarWeekViewDataSource> dataSource;
//默认为 SSCalendarWeekModeDefault.
@property (nonatomic, readwrite) SSCalendarWeekMode weekMode;
//如果设置了自定义weekArray，还需要指定周六和周日的位置，此时weekMode就失效了。
@property (nonatomic, strong) NSArray<NSString *> *weekArray;
@property (nonatomic, readonly) NSUInteger saturday; //1-7，默认为7，SSCalendarWeekModeUsually为6
@property (nonatomic, readonly) NSUInteger sunday;   //1-7，默认为1，SSCalendarWeekModeUsually为7
@property (nonatomic, strong) UIColor *weekdayColor; //工作日文字颜色，默认黑色
@property (nonatomic, strong) UIColor *weekendColor; //周末文字颜色，默认红色

- (void)reloadWeekView;
- (void)setSaturday:(NSUInteger)saturday sunday:(NSUInteger)sunday; //1-7

@end

NS_ASSUME_NONNULL_END
