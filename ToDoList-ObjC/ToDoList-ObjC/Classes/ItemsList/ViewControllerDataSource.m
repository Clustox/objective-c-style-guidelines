//
//  ViewControllerDataSource.m
//  ToDoList-ObjC
//
//  Created by Saira on 8/16/16.
//  Copyright © 2016 Saira. All rights reserved.
//

#import "ViewControllerDataSource.h"
#import "AppDelegate.h"
#import "ToDoItemCell.h"

@interface ViewControllerDataSource() <UITableViewDataSource> {    
    /// Activity Log that will be displayed in the table view
    NSMutableArray *toDoItems;
}

@end

@implementation ViewControllerDataSource

- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self == [super init]) {
        self.tableView = tableView;
    }
    
    self.tableView.dataSource = self;
    [self fetchItems];
    
    return self;
}


/**
 *  Fetches To-Do list saved in Cored data and shows them in list
 */
- (void)fetchItems {
    toDoItems = [NSMutableArray array];
    
    NSManagedObjectContext *managedContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"ToDoItem"
                                                         inManagedObjectContext:managedContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = entityDescription;
    
    NSError *error;
    NSArray *results = [managedContext executeFetchRequest:fetchRequest
                                                            error:&error];
    
    if (error) {
        assert(error);
    }
    
    [toDoItems addObjectsFromArray:results];
    [self.tableView reloadData];
}


/**
 *  Inserts new item and reloads the table view after insertion
 *
 *  @param name : Name of newly inserted To-Do Item
 */
- (void)insertNewItem:(NSString *)name {
    NSManagedObjectContext *managedContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"ToDoItem"
                                                         inManagedObjectContext:managedContext];
    
    ManagedToDoItem *managedItem = [[ManagedToDoItem alloc] initWithEntity:entityDescription
                                          insertIntoManagedObjectContext:managedContext];
    managedItem.name = name;
    
    NSError *error;
    [managedContext save:&error];
    
    if (error) {
        assert(error);
    }
    
    [toDoItems addObject:managedItem];
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSourceMethods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /**
     *  If index path does not exist in datasource, app will abort
     */
    if (indexPath.row < 0 || indexPath.row >= [toDoItems count]) {
        NSLog(@"No Item at indexPath, check data source.");
        abort();
    }
    
    ToDoItemCell *cell = (ToDoItemCell *)[tableView dequeueReusableCellWithIdentifier:@"to_do_cell"];
    
    /**
     *  if cell with this identifier is not added to tableview, app will abort.
     */
    if (!cell) {
        NSLog(@"No Item at indexPath, check data source.");
        abort();
    }
    
    ManagedToDoItem *item = [toDoItems objectAtIndex:indexPath.row];
    [cell configure:item];
    
    return cell;
}

@end
