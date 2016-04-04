//
//  ViewController.m
//  KSTableViewManager
//
//  Created by Konrad Szczesniak on 20/03/16.
//  Copyright © 2016 Konrad Szczesniak. All rights reserved.
//

#import "ViewController.h"
#import "KSTableViewManager.h"
#import "TextRow.h"
#import "KSTableViewActionable.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) KSTableViewManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.manager = [[KSTableViewManager alloc] initWithTableView:self.tableView];
    [self.manager attachDelegates];

    [self.manager insertRow:[TextRow rowWithText:@"Example 1"]];
    [self.manager insertRow:[TextRow rowWithText:@"Example 2"]];
    [self.manager insertRow:[TextRow rowWithText:@"Example 3"]];
    [self.manager insertRow:[TextRow rowWithText:@"Example 4"]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.manager insertRow:[TextRow rowWithText:@"Hehehe"] animation:UITableViewRowAnimationAutomatic];
    });
}

@end
