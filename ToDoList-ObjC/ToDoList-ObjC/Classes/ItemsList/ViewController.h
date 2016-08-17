//
//  ViewController.h
//  ToDoList-ObjC
//
//  Created by Saira on 8/16/16.
//  Copyright © 2016 Saira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end


@interface ViewController (ShowAlert)

- (void)alertWithTitle:(NSString *)title message:(NSString *)message;

@end
