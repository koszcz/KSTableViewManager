//
// Created by Konrad Szczesniak on 22/04/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol KSTableViewManagerRow <NSObject>

- (CGFloat)cellHeight;
- (void)configureCell:(id)cell;

@optional

- (CGFloat)estimatedCellHeight;
- (UINib *)nibForCell;
- (Class)classForCell;

- (void)didSelectCell;
- (void)willDisplayCell;

@end