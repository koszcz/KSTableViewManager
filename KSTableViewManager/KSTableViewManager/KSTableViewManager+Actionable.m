//
// Created by Konrad Szczesniak on 20/03/16.
// Copyright (c) 2016 Konrad Szczesniak. All rights reserved.
//

#import "KSTableViewManager+Actionable.h"
#import "KSTableViewSection.m"

@implementation KSTableViewManager (Actionable)

- (void)insertRow:(id <KSTableViewRow>)row
{
    [[self firstSection] insertRow:row];
}

- (void)insertRow:(id <KSTableViewRow>)row atIndex:(NSUInteger)index
{
    [[self firstSection] insertRow:row atIndex:index];
}

- (void)insertRow:(id <KSTableViewRow>)row animation:(UITableViewRowAnimation)animation
{
    [[self firstSection] insertRow:row animation:animation];
}

- (void)insertRow:(id <KSTableViewRow>)row atIndex:(NSUInteger)index animation:(UITableViewRowAnimation)animation
{
    [[self firstSection] insertRow:row atIndex:index animation:animation];
}

- (void)reloadRow:(id <KSTableViewRow>)row
{
    [[self firstSection] reloadRow:row];
}

- (void)removeRow:(id <KSTableViewRow>)row
{
    [[self firstSection] removeRow:row];
}

- (void)removeRowAtIndex:(NSUInteger)index
{
    [[self firstSection] removeRowAtIndex:index];
}

- (void)removeRow:(id <KSTableViewRow>)row animation:(UITableViewRowAnimation)animation
{
    [[self firstSection] removeRow:row animation:animation];
}

- (void)removeRowAtIndex:(NSUInteger)index animation:(UITableViewRowAnimation)animation
{
    [[self firstSection] removeRowAtIndex:index animation:animation];
}

- (void)removeAllRows
{
    [[self firstSection] removeAllRows];
}

- (void)replaceRowAtIndex:(NSUInteger)index withRow:(id <KSTableViewRow>)row animation:(UITableViewRowAnimation)animation
{
    [[self firstSection] replaceRowAtIndex:index withRow:row animation:animation];
}

- (UITableViewCell *)cellForRow:(id <KSTableViewRow>)row
{
    return [[self firstSection] cellForRow:row];
}

- (void)scrollToIndex:(NSUInteger)index animated:(BOOL)animated
{
    [[self firstSection] scrollToIndex:index animated:animated];
}

- (void)scrollToRow:(id <KSTableViewRow>)row animated:(BOOL)animated
{
    [[self firstSection] scrollToRow:row animated:animated];
}

- (void)insertGuideNamed:(NSString *)name
{
    [[self firstSection] insertGuideNamed:name];
}

- (void)insertGuideNamed:(NSString *)name atIndex:(NSUInteger)index
{
    [[self firstSection] insertGuideNamed:name atIndex:index];
}

- (NSUInteger)indexForRowAfterGuideNamed:(NSString *)name
{
    return [[self firstSection] indexForRowAfterGuideNamed:name];
}

- (KSTableViewSection *)firstSection
{
    if (self.sections.count == 0) {
        [self createSection];
    }
    return [self.sections firstObject];
}

@end
