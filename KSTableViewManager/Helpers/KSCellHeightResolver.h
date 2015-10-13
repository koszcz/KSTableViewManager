//
// Created by Konrad Szczesniak on 27/05/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol KSTableViewManagerRow;

@interface KSCellHeightResolver : NSObject

@property (nonatomic, assign) BOOL useAutomaticSystemResolver;

- (instancetype)initWithTableView:(UITableView *)tableView;
- (CGFloat)resolveHeightForRow:(id <KSTableViewManagerRow>)row;

@end