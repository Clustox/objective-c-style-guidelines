//
//  ViewControllerDataSource.h
//  ToDoList-ObjC
//
//  Created by Saira on 8/16/16.
//  Copyright © 2016 Saira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// Data Source for To-Do Items List
@interface ViewControllerDataSource : NSObject {
    
}

/// Tableview to display To-do items
@property (weak, nonatomic) UITableView *tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;

- (void)insertNewItem:(NSString *)name;

@end
