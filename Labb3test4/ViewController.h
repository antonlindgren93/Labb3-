//
//  ViewController.h
//  Labb3test4
//
//  Created by Anton Lindgren on 2020-01-22.
//  Copyright © 2020 Anton Lindgren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *arrayData;
    NSMutableArray *arrayToDelete;
}


@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)addBtn:(id)sender;

- (IBAction)btnDelete:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

