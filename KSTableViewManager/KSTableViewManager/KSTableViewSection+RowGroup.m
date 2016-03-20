//
// Created by Bartlomiej Guminiak on 19/06/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import "KSTableViewSection+RowGroup.h"

@implementation KSTableViewSection (RowGroup)

- (void)addRows:(NSArray *)rows
{
    [rows enumerateObjectsUsingBlock:^(id<KSTableViewRow> row, NSUInteger idx, BOOL *stop) {
        [self addRow:row];
    }];
}

- (void)insertRows:(NSArray *)rows afterRow:(id <KSTableViewRow>)row
{
    NSUInteger index = [self.rows indexOfObject:row] + 1;
    [self insertRows:rows atIndex:index];
}

- (void)removeAllRowsAfterRow:(id <KSTableViewRow>)row
{
    NSUInteger index = [self.rows indexOfObject:row] + 1;
    while (index < self.rows.count && self.rows[index]) {
        [self removeRowAtIndex:index];
    }
}

- (void)removeRowCount:(NSUInteger)rowCount afterRow:(id <KSTableViewRow>)row
{
    NSUInteger index = [self.rows indexOfObject:row] + 1;
    while (rowCount) {
        [self removeRowAtIndex:index];
        rowCount--;
    }
}

- (void)insertRows:(NSArray *)rows atIndex:(NSUInteger)index
{
    [rows enumerateObjectsUsingBlock:^(id <KSTableViewRow> row, NSUInteger idx, BOOL *stop) {
        [self insertRow:row atIndex:index + idx];
    }];
}

@end