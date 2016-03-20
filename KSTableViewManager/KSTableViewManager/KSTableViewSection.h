//
// Created by Konrad Szczesniak on 22/04/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol KSTableViewRow;

@interface KSTableViewSection : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<UIScrollViewDelegate> scrollViewDelegate;
@property (nonatomic, readonly) NSArray *rows;
@property (nonatomic, readonly) UITableView *tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;
- (void)attachDelegates;

- (void)insertRow:(id <KSTableViewRow>)row;
- (void)insertRow:(id <KSTableViewRow>)row atIndex:(NSUInteger)index;
- (void)insertRow:(id <KSTableViewRow>)row animation:(UITableViewRowAnimation)animation;
- (void)insertRow:(id <KSTableViewRow>)row atIndex:(NSUInteger)index animation:(UITableViewRowAnimation)animation;

- (void)reloadRow:(id <KSTableViewRow>)row;

- (void)removeRow:(id <KSTableViewRow>)row;
- (void)removeRowAtIndex:(NSUInteger)index;
- (void)removeRow:(id <KSTableViewRow>)row animation:(UITableViewRowAnimation)animation;
- (void)removeRowAtIndex:(NSUInteger)index animation:(UITableViewRowAnimation)animation;
- (void)removeAllRows;

- (void)replaceRowAtIndex:(NSUInteger)index withRow:(id <KSTableViewRow>)row animation:(UITableViewRowAnimation)animation;

- (UITableViewCell *)cellForRow:(id <KSTableViewRow>)row;

// Scrolling

- (void)scrollToIndex:(NSUInteger)index animated:(BOOL)animated;
- (void)scrollToRow:(id <KSTableViewRow>)row animated:(BOOL)animated;

// Helper guides

- (void)insertGuideNamed:(NSString *)name;
- (void)insertGuideNamed:(NSString *)name atIndex:(NSUInteger)index;

- (NSUInteger)indexForRowAfterGuideNamed:(NSString *)name;

@end