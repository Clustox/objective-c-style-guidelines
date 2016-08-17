//
//  ViewControllerDelegate.m
//  ToDoList-ObjC
//
//  Created by Saira on 8/16/16.
//  Copyright © 2016 Saira. All rights reserved.
//

#import "ViewControllerDelegate.h"
#import "ToDoItemCell.h"

@interface ViewControllerDelegate() <UITableViewDelegate>

@end

@implementation ViewControllerDelegate

- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self == [super init]) {
        self.tableView = tableView;
    }
    
    [self configureTableView];
    return self;
}

/**
 *  Configures table view's row height and header here
 */
- (void)configureTableView {
    self.tableView.estimatedRowHeight = [ToDoItemCell prefferedHeight];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self configureTableHeader];
    self.tableView.delegate = self;
}

@end

@implementation ViewControllerDelegate (Configuration)

/**
 *  Configuring table header is necessary else it will show empty space above
 *  table view
 */
- (void)configureTableHeader {
    UIView *tableHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 1)];
    tableHeader.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = tableHeader;
}

@end