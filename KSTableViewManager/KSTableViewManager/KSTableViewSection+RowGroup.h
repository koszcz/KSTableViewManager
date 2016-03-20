//
// Created by Bartlomiej Guminiak on 19/06/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSTableViewSection.h"

@interface KSTableViewSection (RowGroup)

- (void)addRows:(NSArray *)rows;
- (void)insertRows:(NSArray *)rows afterRow:(id <KSTableViewRow>)row;

- (void)removeAllRowsAfterRow:(id <KSTableViewRow>)row;
- (void)removeRowCount:(NSUInteger)rowCount afterRow:(id <KSTableViewRow>)row;

@end