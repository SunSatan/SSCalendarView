//
//  SSCalendarMonthCell.h
//  SSCalendarView
//
//  Created by muzhi on 2020/4/1.
//  Copyright © 2020 SunSatan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SSCalendarDayCell, SSCalendarMonthCell;

@protocol SSCalendarMonthCellDataSource <NSObject>

@optional



@end

@interface SSCalendarMonthCell : UICollectionViewCell

@end

NS_ASSUME_NONNULL_END
