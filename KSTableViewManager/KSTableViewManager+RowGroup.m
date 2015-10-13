//
// Created by Bartlomiej Guminiak on 19/06/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import "KSTableViewManager+RowGroup.h"

@implementation KSTableViewManager (RowGroup)

- (void)addRows:(NSArray *)rows
{
    [rows enumerateObjectsUsingBlock:^(id<KSTableViewManagerRow> row, NSUInteger idx, BOOL *stop) {
        [self addRow:row];
    }];
}

- (void)insertRows:(NSArray *)rows afterRow:(id <KSTableViewManagerRow>)row
{
    NSUInteger index = [self.rows indexOfObject:row] + 1;
    [self insertRows:rows atIndex:index];
}

- (void)removeAllRowsAfterRow:(id <KSTableViewManagerRow>)row
{
    NSUInteger index = [self.rows indexOfObject:row] + 1;
    while (index < self.rows.count && self.rows[index]) {
        [self removeRowAtIndex:index];
    }
}

- (void)removeRowCount:(NSUInteger)rowCount afterRow:(id <KSTableViewManagerRow>)row
{
    NSUInteger index = [self.rows indexOfObject:row] + 1;
    while (rowCount) {
        [self removeRowAtIndex:index];
        rowCount--;
    }
}

- (void)insertRows:(NSArray *)rows atIndex:(NSUInteger)index
{
    [rows enumerateObjectsUsingBlock:^(id <KSTableViewManagerRow> row, NSUInteger idx, BOOL *stop) {
        [self insertRow:row atIndex:index + idx];
    }];
}

@end