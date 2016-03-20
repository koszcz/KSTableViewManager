//
// Created by Konrad Szczesniak on 22/04/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol KSTableViewManagerRow;

@interface KSTableViewManager : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<UIScrollViewDelegate> scrollViewDelegate;
@property (nonatomic, readonly) NSArray *rows;
@property (nonatomic, readonly) UITableView *tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;
- (void)attachDelegates;


- (void)replaceRowAtIndex:(NSUInteger)index withRow:(id <KSTableViewManagerRow>)row animation:(UITableViewRowAnimation)animation;

- (void)removeRow:(id <KSTableViewManagerRow>)row;
- (void)removeRowAtIndex:(NSUInteger)index;
- (void)removeAllRows;

- (void)insertRow:(id <KSTableViewManagerRow>)row;
- (void)insertRow:(id <KSTableViewManagerRow>)row atIndex:(NSUInteger)index;

- (void)removeRow:(id <KSTableViewManagerRow>)row animation:(UITableViewRowAnimation)animation;
- (void)removeRowAtIndex:(NSUInteger)index animation:(UITableViewRowAnimation)animation;

- (void)insertRow:(id <KSTableViewManagerRow>)row animation:(UITableViewRowAnimation)animation;
- (void)insertRow:(id <KSTableViewManagerRow>)row atIndex:(NSUInteger)index animation:(UITableViewRowAnimation)animation;

- (UITableViewCell *)cellForRow:(id <KSTableViewManagerRow>)row;

- (void)scrollToIndex:(NSUInteger)index animated:(BOOL)animated;
- (void)scrollToRow:(id <KSTableViewManagerRow>)row animated:(BOOL)animated;

- (void)reloadRow:(id <KSTableViewManagerRow>)row;

// Helper guides

- (void)insertGuideNamed:(NSString *)name;
- (void)insertGuideNamed:(NSString *)name atIndex:(NSUInteger)index;

- (NSUInteger)indexForRowAfterGuideNamed:(NSString *)name;

@end