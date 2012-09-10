//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import "SideMenuViewController.h"
#import "MFSideMenu.h"
#import "DemoViewController.h"
#import "AppDelegate.h"

@implementation SideMenuViewController

#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Section %d", section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Item %d", indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    DemoViewController *demoController = [[[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:nil] autorelease];
//    demoController.title = [NSString stringWithFormat:@"Demo Controller #%d-%d", indexPath.section, indexPath.row];
//    
//    NSArray *controllers = [NSArray arrayWithObject:demoController];
//    [MFSideMenuManager sharedManager].navigationController.viewControllers = controllers;
//    [MFSideMenuManager sharedManager].navigationController.menuState = MFSideMenuStateHidden;
    AppDelegate*app=   (AppDelegate*)[[UIApplication sharedApplication] delegate] ;
    
    if(app.navigationController.menuState == MFSideMenuStateVisible) {
        [app.navigationController setMenuState:MFSideMenuStateHidden];
        //2 is the  drag me view controller.
        [app.tabBarController setSelectedIndex:2];
        DemoViewController* demoview= (DemoViewController*)[app.tabBarController.viewControllers objectAtIndex:2];
        
        NSLog(@"the index row is %d", indexPath.row);
        [demoview.textView setText:[@"" stringByAppendingFormat:@"%d",indexPath.row]];
        
        
        

    } else {
        [app.navigationController setMenuState:MFSideMenuStateVisible];
        
              
        
        
    }
    
}

@end
