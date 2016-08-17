//
//  ToDoItemCell.m
//  ToDoList-ObjC
//
//  Created by Saira on 8/16/16.
//  Copyright © 2016 Saira. All rights reserved.
//

#import "ToDoItemCell.h"

@implementation ToDoItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


/**
 *  Configures cell with To do item's info
 *
 *  @param item Todo Item
 */
- (void)configure:(ManagedToDoItem *)item {
    self.nameLabel.text = item.name;
}

+ (float)prefferedHeight {
    return 30.0;
}

@end
