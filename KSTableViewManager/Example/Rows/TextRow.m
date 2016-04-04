//
// Created by Konrad Szczesniak on 20/03/16.
// Copyright (c) 2016 Konrad Szczesniak. All rights reserved.
//

#import "TextRow.h"

@interface TextRow ()

@property (nonatomic, copy) NSString *text;

@end

@implementation TextRow

+ (instancetype)rowWithText:(NSString *)text
{
    TextRow *row = [self new];
    row.text = text;
    return row;
}

- (Class)classForCell
{
    return [UITableViewCell class];
}

- (CGFloat)cellHeight
{
    return 45;
}

- (void)configureCell:(__kindof UITableViewCell *)cell
{
    cell.textLabel.text = self.text;
}

@end
