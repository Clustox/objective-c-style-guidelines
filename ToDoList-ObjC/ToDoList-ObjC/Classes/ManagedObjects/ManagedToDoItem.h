//
//  ManagedToDoItem.h
//  ToDoList-ObjC
//
//  Created by Saira on 8/16/16.
//  Copyright © 2016 Saira. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface ManagedToDoItem : NSManagedObject

/**
 *  Name of To-Do Item
 */
@property(strong, nonatomic) NSString *name;

@end
