//
// Created by Konrad Szczesniak on 27/05/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import "KSTableViewManager+Indexes.h"
#import "KSTableViewManagerRow.h"

@implementation KSTableViewManager (Indexes)

- (NSArray *)indexesForRowClass:(Class)className
{
    __block NSMutableArray *array = [NSMutableArray new];
    [self.rows enumerateObjectsUsingBlock:^(id<KSTableViewManagerRow> obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:className]) {
            [array addObject:@(idx)];
        }
    }];
    return array.copy;
}

@end