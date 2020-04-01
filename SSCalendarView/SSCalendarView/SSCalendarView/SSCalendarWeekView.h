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

- (void)calendarWeekView:(SSCalendarWeekView *)calendarWeekView weekLabel:(UILabel *)weekLabel weekday:(NSInteger)weekday;

@end

@interface SSCalendarWeekView : UIView

//默认为 SSCalendarWeekModeDefault.
@property (nonatomic, readwrite) SSCalendarWeekMode weekMode;
//如果设置了自定义weekArray，还需要指定周六和周日的位置，以及weekMode就失效。
@property (nonatomic, copy) NSArray<NSString *> *weekArray;
@property (nonatomic, readonly) NSInteger saturday; //1-7，默认为7，SSCalendarWeekModeUsually为6
@property (nonatomic, readonly) NSInteger sunday;   //1-7，默认为1，SSCalendarWeekModeUsually为7
@property (nonatomic, weak) id<SSCalendarWeekViewDataSource> dataSource;

- (void)reloadWeekView;
- (void)setSaturday:(NSInteger)saturday sunDay:(NSInteger)sunday; //1-7

@end

NS_ASSUME_NONNULL_END
