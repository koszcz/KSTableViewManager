//
// Created by Konrad Szczesniak on 20/03/16.
// Copyright (c) 2016 Konrad Szczesniak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol KSTableViewRow;

@protocol KSTableViewActionable <NSObject>

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
