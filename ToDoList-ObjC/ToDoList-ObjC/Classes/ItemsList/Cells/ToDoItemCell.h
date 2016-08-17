//
//  ToDoItemCell.h
//  ToDoList-ObjC
//
//  Created by Saira on 8/16/16.
//  Copyright © 2016 Saira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManagedToDoItem.h"

@interface ToDoItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

- (void)configure:(ManagedToDoItem *)item;
/**
 *  Preferred height for this cell
 *
 *  @return a float value for height
 */
+ (float)prefferedHeight;

@end
