//
// Created by Konrad Szczesniak on 27/05/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSTableViewSection.h"

@interface KSTableViewSection (Indexes)

- (NSArray *)indexesForRowClass:(Class)className;

@end