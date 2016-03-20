//
// Created by Konrad Szczesniak on 20/03/16.
// Copyright (c) 2016 Konrad Szczesniak. All rights reserved.
//

#import "KSTableViewManager.h"
#import "KSTableViewSection.h"

@interface KSTableViewManager () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<KSTableViewSection *> *sections;

@end

@implementation KSTableViewManager

- (instancetype)initWithTableView:(UITableView *)tableView
{
    if (self = [super init]) {
        _tableView = tableView;
        _sections = [NSMutableArray new];
    }
    return self;
}

- (void)attachDelegates
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (KSTableViewSection *)createSection
{
    NSUInteger position = self.sections.count;
    KSTableViewSection *section = [KSTableViewSection sectionWithTableView:self.tableView
                                                                  position:position];
    [self.tableView beginUpdates];
    [self.sections addObject:section];
    [self.tableView insertSections:[NSIndexSet indexSetWithIndex:position] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
    return section;
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    KSTableViewSection *obj = self.sections[(NSUInteger) section];
    return [obj numberOfRows];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KSTableViewSection *section = self.sections[(NSUInteger) indexPath.section];
    return [section estimatedHeightForRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KSTableViewSection *section = self.sections[(NSUInteger) indexPath.section];
    return [section heightForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KSTableViewSection *section = self.sections[(NSUInteger) indexPath.section];
    return [section cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KSTableViewSection *section = self.sections[(NSUInteger) indexPath.section];
    [section didSelectRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    KSTableViewSection *section = self.sections[(NSUInteger) indexPath.section];
    [section willDisplayCell:cell forRowAtIndexPath:indexPath];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.scrollViewDelegate scrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self.scrollViewDelegate scrollViewDidEndScrollingAnimation:scrollView];
}

@end
