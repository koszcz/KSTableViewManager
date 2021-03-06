//
// Created by Konrad Szczesniak on 22/04/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSTableViewSection.h"
#import "KSTableViewRow.h"

@interface KSTableViewSection ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *collection;

@property (nonatomic, strong) NSMutableArray *collectionWithGuides;

@property (nonatomic) NSUInteger position;

@end

@implementation KSTableViewSection

+ (KSTableViewSection *)sectionWithTableView:(UITableView *)view position:(NSUInteger)position
{
    KSTableViewSection *section = [self new];
    section.tableView = view;
    section.position = position;
    return section;
}

- (instancetype)init
{
    if (self = [super init]) {
        _collection = [NSMutableArray new];
        _collectionWithGuides = [NSMutableArray new];
    }
    return self;
}

- (void)addToCollection:(id<KSTableViewRow>)row atIndex:(NSUInteger)index
{
    NSUInteger elementIndex = self.collectionWithGuides.count;

    if (self.collection.count != index) {
        id element = self.collection[index];
        elementIndex = [self.collectionWithGuides indexOfObject:element];
    }

    [self.collection insertObject:row atIndex:index];
    [self.collectionWithGuides insertObject:row atIndex:elementIndex];
}

- (void)removeFromCollectionAtIndex:(NSUInteger)index
{
    id element = self.collection[index];
    NSUInteger elementIndex = [self.collectionWithGuides indexOfObject:element];
    [self.collection removeObjectAtIndex:index];
    [self.collectionWithGuides removeObjectAtIndex:elementIndex];
}

- (void)replaceAtIndex:(NSUInteger)index withRow:(id <KSTableViewRow>)row
{
    id element = self.collection[index];
    NSUInteger elementIndex = [self.collectionWithGuides indexOfObject:element];
    self.collection[index] = row;
    self.collectionWithGuides[elementIndex] = row;
}

- (void)replaceRowAtIndex:(NSUInteger)index withRow:(id <KSTableViewRow>)row animation:(UITableViewRowAnimation)animation
{
    [self registerCellWithRow:row];
    [self.tableView beginUpdates];
    [self replaceAtIndex:index withRow:row];
    [self.tableView reloadRowsAtIndexPaths:@[ [self indexPathForIndex:index] ] withRowAnimation:animation];
    [self.tableView endUpdates];
}

- (void)removeRow:(id <KSTableViewRow>)row animation:(UITableViewRowAnimation)animation
{
    NSUInteger index = [self.collection indexOfObject:row];
    [self removeRowAtIndex:index animation:animation];
}

- (void)removeRow:(id<KSTableViewRow>)row
{
    [self removeRow:row animation:UITableViewRowAnimationAutomatic];
}

- (void)removeRowAtIndex:(NSUInteger)index animation:(UITableViewRowAnimation)animation
{
    if (index < self.collection.count) {
        [self.tableView beginUpdates];
        [self removeFromCollectionAtIndex:index];
        [self.tableView deleteRowsAtIndexPaths:@[[self indexPathForIndex:index]] withRowAnimation:animation];
        [self.tableView endUpdates];
    }
}

- (void)removeRowAtIndex:(NSUInteger)index
{
    [self removeRowAtIndex:index animation:UITableViewRowAnimationAutomatic];
}

- (void)removeAllRows
{
    [self.collection removeAllObjects];
    [self.collectionWithGuides removeAllObjects];
    [self.tableView reloadData];
}

- (void)insertRow:(id <KSTableViewRow>)row animation:(UITableViewRowAnimation)animation
{
    [self insertRow:row atIndex:self.collection.count animation:animation];
}

- (void)insertRow:(id <KSTableViewRow>)row
{
    [self insertRow:row animation:UITableViewRowAnimationAutomatic];
}

- (void)insertRow:(id <KSTableViewRow>)row atIndex:(NSUInteger)index animation:(UITableViewRowAnimation)animation
{
    [self registerCellWithRow:row];
    [self.tableView beginUpdates];
    [self addToCollection:row atIndex:index];
    [self.tableView insertRowsAtIndexPaths:@[ [self indexPathForIndex:index] ] withRowAnimation:animation];
    [self.tableView endUpdates];
}

- (void)insertRow:(id<KSTableViewRow>)row atIndex:(NSUInteger)index
{
    [self insertRow:row atIndex:index animation:UITableViewRowAnimationAutomatic];
}

- (UITableViewCell *)cellForRow:(id<KSTableViewRow>)row
{
    __block UITableViewCell *cell;
    NSInteger indexOfRow = [self.collection indexOfObject:row];
    [self.tableView.indexPathsForVisibleRows enumerateObjectsUsingBlock:^(NSIndexPath *indexPath, NSUInteger idx, BOOL *stop) {
        NSInteger indexOfCell = [self indexForIndexPath:indexPath];
        if (indexOfRow == indexOfCell) {
            cell = [self.tableView cellForRowAtIndexPath:indexPath];
            *stop = YES;
        }
    }];
    return cell;
}

- (void)scrollToIndex:(NSUInteger)index animated:(BOOL)animated
{
    NSIndexPath *indexPath = [self indexPathForIndex:index];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:animated];
}

- (void)scrollToRow:(id <KSTableViewRow>)row animated:(BOOL)animated
{
    NSUInteger index = [self.collection indexOfObject:row];
    [self scrollToIndex:index animated:animated];
}

- (void)reloadRow:(id <KSTableViewRow>)row
{
    NSUInteger index = [self.collection indexOfObject:row];
    NSIndexPath *indexPath = [self indexPathForIndex:index];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)registerCellWithRow:(id <KSTableViewRow>)row
{
    NSString *reuseId = [self rowReuseId:row.class];
    if ([row respondsToSelector:@selector(nibForCell)]) {
        [self.tableView registerNib:[row nibForCell] forCellReuseIdentifier:reuseId];
    } else if ([row respondsToSelector:@selector(classForCell)]) {
        [self.tableView registerClass:[row classForCell] forCellReuseIdentifier:reuseId];
    } else {
        NSAssert(false, @"Table View Row should implement one of the following methods: nibForCell, classForCell");
    }
}

- (void)insertGuideNamed:(NSString *)name
{
    [self.collectionWithGuides addObject:name];
}

- (void)insertGuideNamed:(NSString *)name atIndex:(NSUInteger)index
{
    id element = self.collection[index];
    NSUInteger elementIndex = [self.collectionWithGuides indexOfObject:element];
    [self.collectionWithGuides insertObject:name atIndex:elementIndex];
}

- (NSUInteger)indexForRowAfterGuideNamed:(NSString *)name
{
    __block NSUInteger index = 0;
    [self.collectionWithGuides enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (![obj isKindOfClass:[NSString class]]) {
            index++;
        }
        if ([obj isEqual:name]) {
            *stop = YES;
        }
    }];
    return index;
}

#pragma mark - UITableView

- (NSInteger)numberOfRows
{
    return self.collection.count;
}

- (CGFloat)estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<KSTableViewRow> row = [self rowForIndexPath:indexPath];
    if ([row respondsToSelector:@selector(estimatedCellHeight)]) {
        return [row estimatedCellHeight];
    } else {
        return [row cellHeight];
    }
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<KSTableViewRow> row = [self rowForIndexPath:indexPath];
    return [row cellHeight];
}

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<KSTableViewRow> row = [self rowForIndexPath:indexPath];
    UITableViewCell *tableViewCell = [self.tableView dequeueReusableCellWithIdentifier:[self rowReuseId:row.class]];
    [row configureCell:tableViewCell];
    return tableViewCell;
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<KSTableViewRow> row = [self rowForIndexPath:indexPath];
    if ([row respondsToSelector:@selector(didSelectCell)]) {
        [row didSelectCell];
    }
}

- (void)willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<KSTableViewRow> row = [self rowForIndexPath:indexPath];
    if ([row respondsToSelector:@selector(willDisplayCell)]) {
        [row willDisplayCell];
    }
}

#pragma mark - Helpers

- (NSArray *)rows
{
    return self.collection;
}

- (id<KSTableViewRow>)rowForIndexPath:(NSIndexPath *)indexPath
{
    return self.collection[(NSUInteger) indexPath.row];
}

- (NSString *)rowReuseId:(Class)className
{
    return NSStringFromClass(className);
}

- (NSIndexPath *)indexPathForIndex:(NSUInteger)index
{
    return [NSIndexPath indexPathForRow:index inSection:self.position];
}

- (NSInteger)indexForIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row;
}

@end