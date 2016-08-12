# Objective-C Style guide

## Introduction

This style guide covers basic coding conventions and best practices for Objective-C. 

<br>
Working with Swift? Here is our [guideline for Swift](https://github.com/Clustox/swift-style-guidelines)

- - - -
### Naming Conventions

* Name of variable, method, protocols and classes must describe the functionality clearly so try to avoid ambiguous names.

#### Avoid Using
```objective-c
IBOutlet UIButton *btn;
IBOutlet UIButton *btn1;
IBOutlet UIButton *btn2;

- (void)doSomeStuff:(NSString *)str;
```

#### Instead Use
```objective-c
IBOutlet UIButton *closeButton;
IBOutlet UIButton *saveButton;
IBOutlet UIButton *undoButton;

- (void)printInput:(NSString *)input;
```

* Avoid using abbreviations and cross check for spelling mistakes.

#### Avoid Using
```objective-c
IBOutlet UIButton *btn;
UIColor *color;
NSMutableArray *array;

- (void)prntInpt:(NSString *)inpt;
```

#### Instead Use
```objective-c
IBOutlet UIButton *saveButton;
UIColor *selectedColor;
NSMutableArray *tagsArray;

- (void)printInput:(NSString *)input;
```

* If a method requires more than one parameter, append them with proper description and names.

#### Avoid Using
```objective-c
- (void)configure:(UITableViewCell *)cell :(NSIndexPath *)indexPath;
```

#### Instead Use
```objective-c
- (void)configureUserCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
```

* Variable, parameter and method names must start with a lowercase letter and rest of the name will be camel case.

#### Avoid Using
```objective-c
IBOutlet UIButton *CloseButton;

- (void)ViewDidAppear:(BOOL)animated;
- (void)viewdidappear:(BOOL)Animated;
```

#### Instead Use
```objective-c
IBOutlet UIButton *closeButton;

- (void)viewDidAppear:(BOOL)animated;
```

* Avoid using numbers, underscore and other special characters in name declaration.

#### Avoid Using
```objective-c
IBOutlet UIButton *close_button;
int amount_to_pay;
int count1;
```

#### Instead Use
```objective-c
IBOutlet UIButton *closeButton;
int amountToPay;
int count;
```

### Defining Variable and Methods

* While defining variable, asterisk must be attached to the variable name instead of type.

#### Avoid Using
```objective-c
IBOutlet UIButton* closeButton;
```

#### Instead Use
```objective-c
IBOutlet UIButton *closeButton;
```

* While defining methods, there must be a space between + or - and the return type.

#### Avoid Using
```objective-c
-(void) viewDidAppear:(BOOL)animated;
- (void) viewDidAppear: (BOOL)animated;
- (void)viewDidAppear:(BOOL) animated;
```

#### Instead Use
```objective-c
- (void)viewDidAppear:(BOOL)animated;
- (void)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC;
```

### Spaces

* Method braces and other braces (If/else, switch, for, while) shall be on the same line as statement but ending braces shall be on next line.
* Avoid adding more than two vertical spaces between two methods.


### Code Organization

* Use pragma mark to organize code into blocks.

```objective-c
#pragma mark - Support

+ (NSString *)stringWithNewUUID;
- (NSString *)stringByDecodingURLFormat;
- (NSString *)encodedString;

#pragma mark – ConversionToDate

- (NSDate *)toDate;
- (NSDate *)toLongDate;

#pragma mark - Validations

- (BOOL)isEmpty;
- (BOOL)hasSpaces;
```

### Dot Notation

* Dot syntax is a convenient wrapper around method calls. By using dot syntax, the property is still accessed or changed using getter and setter methods.

* Dot-notation is preferred for getters setters as it makes code more concise. Bracket notation is preferred in all other instances too.

#### Avoid Using
```objective-c
[detailsLabel setText: @"This is a detailed label"];
[tableView setBackgroundColor: [UIColor redColor]];
```

#### Instead Use
```objective-c
detailsLabel.text = @"This is a detailed label";
tableView.backgroundColor = [UIColor redColor];
int countOfEmployees = [employees count];
```

### Immutable literals vs Mutable 

<p>Prefer using NSString, NSArray, NSSet, NSDictionary, NSNumber when possible. Use their mutable counterparts only when you are sure that this object is going to change in future.</p>

#### Avoid Using
```objective-c
NSMutableArray *countries = [[NSMutableArray alloc] initWithObjects:@"Pakistan", @"China", @"Turkey", @"Bangladesh", nil];
NSMutableDictionary *managers = [[NSMutableDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Marketing", @"Sales", @"Purchase",  nil]
                                                                         forKeys:[NSArray arrayWithObjects:@"Bill", @"Sonya", @"Yusuf",  nil]];
```

#### Instead Use
```objective-c
NSArray *countries = @[@"Pakistan", @"China", @"Turkey", @"Bangladesh"];
NSDictionary *managers = @{@"Marketing": @"Bill", @"Sales ": @"Sonya", @"Purchase": @"Yusuf"};
```

### Private Variables

* Private properties and methods must be described in implementation file of a class.

```objective-c
@interface SearchResultsViewController () {
    IBOutlet UILabel *noResultsLabel;
    NSMutableArray *results;
    NSMutableArray *requestedIndexPaths;  
}
@end
```

### Blocks

* Blocks should have a space between their return type and name.
* Block definitions should omit their return type when possible.
* Block definitions should omit their arguments if they are void.

```objective-c
void (^doSomeThing)(void) = ^{
  //do some thing
};
```

### Dealloc

* After launch of arc, dealloc is not implemented the same way as it was used to be. But we still need it with a little modifications such as notification observers are needed to be removed and similar deleagtes are needed to be unset in dealloc.

### Documentation

* Code must be properly documented.
* Changing a block of code must be documented so rest of the developers can see the reason for change.
* Doing some task in a not recommended way needs to be properly documented.

### General Guidelines

* Class and protocol names must be in camel case.

#### Avoid Using
```objective-c
uialertviewdelegate
uitableview
Profileviewcontroller
```

#### Instead Use
```objective-c
UIAlertViewDelegate
UITableView
ProfileViewController
```

* Remove commented and unused code from the project.
* A class must not exceed 200 lines of code. If it does, it's time to refactor.
* If you want to add any functionality to the existing code, add a new extension of that class instead of changing the current one.
* Separate business logic completely, from controller code.
* Try to keep your methods clean and simple. One method must perform one funtion only.
* If methods or classes are getting complex, refactor your code.

### Credits

This guide is established through a collaborative effort of Team Clustox. Following are some of the sources we have taken inspiration from:

* [Github](https://github.com/github/objective-c-style-guide)
* [Raywenderlich](https://github.com/raywenderlich/objective-c-style-guide)
* [CocoaDevCentral](http://cocoadevcentral.com/articles/000082.php)
* [NYTimes](https://github.com/NYTimes/objective-c-style-guide#private-properties)
* [RobotsAndPencils](https://github.com/RobotsAndPencils/objective-c-style-guide#code-naming)
* [CIMGF](http://www.cimgf.com/zds-code-style-guide/)
