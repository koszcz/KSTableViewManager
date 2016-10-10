//
// Created by Konrad Szczesniak on 22/04/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KSTableViewActionable.h"

@protocol KSTableViewRow;

@interface KSTableViewSection : NSObject<KSTableViewActionable>

@property (nonatomic, readonly) NSArray *rows;

+ (KSTableViewSection *)sectionWithTableView:(UITableView *)view position:(NSUInteger)position;

- (NSInteger)numberOfRows;
- (CGFloat)estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)path;

@end
