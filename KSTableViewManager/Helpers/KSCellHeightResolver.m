//
// Created by Konrad Szczesniak on 27/05/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import "KSCellHeightResolver.h"
#import "KSTableViewManagerRow.h"

@interface KSCellHeightResolver()

@property (nonatomic, strong) NSMutableDictionary *sizingCells;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation KSCellHeightResolver

- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        _useAutomaticSystemResolver = NO;
        _sizingCells = [NSMutableDictionary new];
        _tableView = tableView;
    }
    return self;
}

- (CGFloat)resolveHeightForRow:(id <KSTableViewManagerRow>)row
{
    CGFloat height = [row cellHeight];
    if (height == UITableViewAutomaticDimension) {
        if (self.useAutomaticSystemResolver && [self isOSVersionGreaterOrEqualThan8]) {
            return height;
        } else {
            return [self manuallyCalculatedHeightForRow:row];
        }
    } else {
        return height;
    }
}

- (CGFloat)manuallyCalculatedHeightForRow:(id <KSTableViewManagerRow>)row
{
    UITableViewCell *sizingCell = [self sizingCellForRow:row];
    [row configureCell:sizingCell];
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (UITableViewCell *)sizingCellForRow:(id <KSTableViewManagerRow>)row
{
    NSString *className = NSStringFromClass([row class]);
    if (!self.sizingCells[className]) {
        self.sizingCells[className] = [self.tableView dequeueReusableCellWithIdentifier:className];
    }
    return self.sizingCells[className];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)cell
{
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(cell.bounds));

    [cell setNeedsLayout];
    [cell layoutIfNeeded];

    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
}

- (BOOL)isOSVersionGreaterOrEqualThan8
{
    return [[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending;
}

@end