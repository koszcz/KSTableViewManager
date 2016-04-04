//
// Created by Konrad Szczesniak on 20/03/16.
// Copyright (c) 2016 Konrad Szczesniak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSTableViewRow.h"

@interface TextRow : NSObject<KSTableViewRow>

+ (instancetype)rowWithText:(NSString *)text;

@end
