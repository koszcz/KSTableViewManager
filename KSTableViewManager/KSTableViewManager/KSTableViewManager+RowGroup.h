//
// Created by Bartlomiej Guminiak on 19/06/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSTableViewManager.h"

@interface KSTableViewManager (RowGroup)

- (void)addRows:(NSArray *)rows;
- (void)insertRows:(NSArray *)rows afterRow:(id <KSTableViewManagerRow>)row;

- (void)removeAllRowsAfterRow:(id <KSTableViewManagerRow>)row;
- (void)removeRowCount:(NSUInteger)rowCount afterRow:(id <KSTableViewManagerRow>)row;

@end