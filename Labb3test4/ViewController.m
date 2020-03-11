//
//  ViewController.m
//  Labb3test4
//
//  Created by Anton Lindgren on 2020-01-22.
//  Copyright © 2020 Anton Lindgren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayData = [[NSMutableArray alloc] init];
    arrayToDelete = [[NSMutableArray alloc] init];
    [self loadState];
 
    
}

- (void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //Visar listan
    if (arrayData.count > 0) {
        return arrayData.count;
    }
    return 0;
    
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    }
    cell.tintColor =[UIColor orangeColor];
    //Visar det man skickar in i listan
    cell.textLabel.text = [NSString stringWithFormat:@"%@",arrayData[indexPath.row]];
    return cell;
}



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Väljer objekt
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    [arrayToDelete addObject:arrayData[indexPath.row]];
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Tar bort valt objekt
    [arrayToDelete removeObject:arrayData[indexPath.row]];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 3;
}

- (IBAction)addBtn:(id)sender {
    [arrayData addObject:self.textField.text];
    [self.tableView reloadData];
    self.textField.text = @"";
    [self saveState];
    
}

- (IBAction)btnDelete:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self.tableView setEditing:sender.selected animated:YES];
    if (arrayToDelete.count) {
        for (NSString *str in arrayToDelete) {
            [arrayData removeObject:str];
        }
        [arrayToDelete removeAllObjects];
        [self.tableView reloadData];
    }
}
-(void) saveState {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:arrayData forKey:@"todos"];
    [defaults synchronize];
    
}
-(void) loadState {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *state = [defaults arrayForKey:@"todos"];
    [arrayData addObjectsFromArray:state];
}


@end
