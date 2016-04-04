//
// Created by Konrad Szczesniak on 20/03/16.
// Copyright (c) 2016 Konrad Szczesniak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KSTableViewActionable.h"

@class KSTableViewSection;

@interface KSTableViewManager : NSObject<KSTableViewActionable>

@property (nonatomic, readonly) NSMutableArray<KSTableViewSection *> *sections;
@property (nonatomic, weak) id<UIScrollViewDelegate> scrollViewDelegate;
@property (nonatomic, readonly) UITableView *tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;
- (void)attachDelegates;

- (KSTableViewSection *)createSection;

@end
