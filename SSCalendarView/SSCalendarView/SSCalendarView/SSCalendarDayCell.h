//
//  SSCalendarDayCell.h
//  SSCalendarView
//
//  Created by muzhi on 2020/4/1.
//  Copyright © 2020 SunSatan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSCalendarDayCell : UICollectionViewCell

@property (nonatomic, strong) UIView  *selectBackgroundView;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@end

NS_ASSUME_NONNULL_END
