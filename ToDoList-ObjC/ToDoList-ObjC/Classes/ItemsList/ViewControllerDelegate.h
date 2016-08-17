//
//  ViewControllerDelegate.h
//  ToDoList-ObjC
//
//  Created by Saira on 8/16/16.
//  Copyright © 2016 Saira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewControllerDelegate : NSObject

/**
 *  Table view to display to do items
 */
@property (weak, nonatomic) UITableView *tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;

@end


@interface ViewControllerDelegate (Configuration)

- (void)configureTableHeader;

@end