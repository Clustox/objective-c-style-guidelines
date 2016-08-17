//
//  ViewController.m
//  ToDoList-ObjC
//
//  Created by Saira on 8/16/16.
//  Copyright © 2016 Saira. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerDataSource.h"
#import "ViewControllerDelegate.h"


/**
 *  Screen for Displaying To do items
 */
@interface ViewController () {
    /**
     *  Delegate object for handling touches on to do list
     */
    ViewControllerDelegate *toDoItemsDelegate;
}
/**
 *  TableView for displaying To-do items
 */
@property (weak, nonatomic) IBOutlet UITableView *toDoList;
/**
 *  Textfield on alert view
 */
@property (weak, nonatomic) UITextField *nameTextField;
/**
 *  The data source object for the table view
 */
@property (strong, nonatomic) ViewControllerDataSource *dataSourceController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"To-Do Items";
    self.dataSourceController = [[ViewControllerDataSource alloc] initWithTableView:self.toDoList];
    toDoItemsDelegate = [[ViewControllerDelegate alloc] initWithTableView:self.toDoList];
    
}

/**
 *  Gets called on clicking add from navigation bar
 *
 *  @param sender Add Button
 */
- (IBAction)addNewItem:(id)sender {
    [self alertWithTitle:@"Add New Item" message:nil];
}

/**
 *  Calls datasource on clicking add button of Alert
 */
- (void)saveNewItem {
    if (!self.dataSourceController || self.nameTextField == nil) {
        return;
    }
    
    NSString *name = self.nameTextField.text;
    if ([name isEqualToString:@""]) {
        return;
    }
    
    [self.dataSourceController insertNewItem:name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

@implementation ViewController (ShowAlert)

/**
 *  Shows alert with a textfield for adding new item to To-Do List
 *
 *  @param title   title of alert
 *  @param message message of alert
 */
- (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                                preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter Item";
        self.nameTextField = textField;
    }];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                        style:UIAlertActionStyleCancel
                                                      handler:nil]];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Add"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
                                                         [self saveNewItem];
                                                     }];
    
    [alertController addAction: okAction];
    
    [alertController.view setNeedsLayout];
    [self presentViewController:alertController animated:TRUE completion:nil];
}

@end