//
//  SSCalendarView.m
//  SSCalendarView
//
//  Created by muzhi on 2020/4/1.
//  Copyright © 2020 SunSatan. All rights reserved.
//

#import "SSCalendarView.h"
#import "SSCalendarWeekView.h"
#import "SSCalendarDayCell.h"

@interface SSCalendarView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *monthCollectionView;
@property (nonatomic, strong) NSLayoutConstraint *monthCollectionViewHeightConstraint;

@property (nonatomic, strong) UIView *calendarHeaderBackgroundView;
@property (nonatomic, strong) UIView *calendarFooterBackgroundView;
@property (nonatomic, strong) NSLayoutConstraint *calendarHeaderBackgroundViewHeightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *calendarFooterBackgroundViewHeightConstraint;

@end

@implementation SSCalendarView

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
    self.clipsToBounds = YES;
    [self loadHeaderBackgroundView];
    [self loadMonthCollectionView];
    [self loadFooterBackgroundView];
}

- (void)layoutSubviews
{
    [self loadSubview];
}

#pragma mark - load view

- (void)reloadCalendar
{
    [self.monthCollectionView reloadData];
}

- (void)loadSubview
{
    static int i = 1;
    NSLog(@"loadSubview %d次", i++);
    [self updateHeaderView];
    [self updateFooterView];
}

- (void)loadHeaderBackgroundView
{
    if (_calendarHeaderBackgroundView) {
        return;
    }
    _calendarHeaderBackgroundView = [[UIView alloc] init];
    _calendarHeaderBackgroundView.backgroundColor = [UIColor blueColor];
    [self addSubview:_calendarHeaderBackgroundView];
    
    _calendarHeaderBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [_calendarHeaderBackgroundView.topAnchor   constraintEqualToAnchor:self.topAnchor].active   = YES;
    [_calendarHeaderBackgroundView.leftAnchor  constraintEqualToAnchor:self.leftAnchor].active  = YES;
    [_calendarHeaderBackgroundView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
    _calendarHeaderBackgroundViewHeightConstraint = [_calendarHeaderBackgroundView.heightAnchor constraintEqualToConstant:0];
    _calendarHeaderBackgroundViewHeightConstraint.active = YES;
}

- (void)loadMonthCollectionView
{
    if (_monthCollectionView) {
        return;
    }
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    if (_verticalScroll) {
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }else{
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    
    _monthCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _monthCollectionView.delegate = self;
    _monthCollectionView.dataSource = self;
    _monthCollectionView.backgroundColor = [UIColor whiteColor];
    [_monthCollectionView registerClass:[SSCalendarDayCell class] forCellWithReuseIdentifier:@"day"];
    [self addSubview:_monthCollectionView];
    
    _monthCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [_monthCollectionView.topAnchor   constraintEqualToAnchor:_calendarHeaderBackgroundView.bottomAnchor].active = YES;
    [_monthCollectionView.leftAnchor  constraintEqualToAnchor:self.leftAnchor].active  = YES;
    [_monthCollectionView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
    _monthCollectionViewHeightConstraint = [_monthCollectionView.heightAnchor constraintEqualToConstant:200];
    _monthCollectionViewHeightConstraint.active = YES;
}

- (void)loadFooterBackgroundView
{
    if (_calendarFooterBackgroundView) {
        return;
    }
    _calendarFooterBackgroundView = [[UIView alloc] init];
    _calendarFooterBackgroundView.backgroundColor = [UIColor orangeColor];
    [self addSubview:_calendarFooterBackgroundView];
    
    _calendarFooterBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [_calendarFooterBackgroundView.topAnchor   constraintEqualToAnchor:_monthCollectionView.bottomAnchor].active = YES;
    [_calendarFooterBackgroundView.leftAnchor  constraintEqualToAnchor:self.leftAnchor].active  = YES;
    [_calendarFooterBackgroundView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
    _calendarFooterBackgroundViewHeightConstraint = [_calendarFooterBackgroundView.heightAnchor constraintEqualToConstant:0];
    _calendarFooterBackgroundViewHeightConstraint.active = YES;
}

- (void)updateHeaderView
{
    if (self.dataSource
        && [self.dataSource respondsToSelector:@selector(calendarViewForCalendarHeaderView:)]) {
        self.calendarHeaderView = [self.dataSource calendarViewForCalendarHeaderView:self];
    }
    
    if (!self.calendarHeaderView) {
        return;
    }
    
    if (self.dataSource
        && [self.dataSource respondsToSelector:@selector(calendarViewForCalendarHeaderViewHeight:)]) {
        self.calendarHeaderViewHeight = [self.dataSource calendarViewForCalendarHeaderViewHeight:self];
    }
    
    [self.calendarHeaderBackgroundView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.calendarHeaderBackgroundView addSubview:self.calendarHeaderView];
}

- (void)updateFooterView
{
    if (self.dataSource
        && [self.dataSource respondsToSelector:@selector(calendarViewForCalendarFooterView:)]) {
        self.calendarFooterView = [self.dataSource calendarViewForCalendarFooterView:self];
    }
    
    if (!self.calendarFooterView) {
           return;
       }
    
    if (self.dataSource
        && [self.dataSource respondsToSelector:@selector(calendarViewForCalendarFooterViewHeight:)]) {
        self.calendarFooterViewHeight = [self.dataSource calendarViewForCalendarFooterViewHeight:self];
    }
    
    [self.calendarFooterBackgroundView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.calendarFooterBackgroundView addSubview:self.calendarFooterView];
}

#pragma mark - setting method

- (void)setPagingEnabled:(BOOL)pagingEnabled
{
    _pagingEnabled = pagingEnabled;
    _monthCollectionView.pagingEnabled = pagingEnabled;
}

- (void)setScrollEnable:(BOOL)scrollEnable
{
    _scrollEnable = scrollEnable;
    _monthCollectionView.scrollEnabled = scrollEnable;
}

- (void)setMonthWeekHidden:(BOOL)monthWeekHidden
{
    _monthWeekHidden = monthWeekHidden;
}

- (void)setCalendarHeaderViewHeight:(CGFloat)calendarHeaderViewHeight
{
    _calendarHeaderViewHeight = calendarHeaderViewHeight >= 0 ? calendarHeaderViewHeight : 0;
    _calendarHeaderBackgroundViewHeightConstraint.constant = _calendarHeaderViewHeight;
}

- (void)setCalendarFooterViewHeight:(CGFloat)calendarFooterViewHeight
{
    _calendarFooterViewHeight = calendarFooterViewHeight >= 0 ? calendarFooterViewHeight : 0;
    _calendarFooterBackgroundViewHeightConstraint.constant = _calendarFooterViewHeight;
}

#pragma mark - collectionView dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SSCalendarDayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"day" forIndexPath:indexPath];
    return cell;
}

#pragma mark - collectionView delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = self.bounds.size.width / 7.0;
    return CGSizeMake(width, width);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}

@end
