//
//  BJQViewController.m
//  iOS-XMLDOM-demo
//
//  Created by kevin on 13-5-28.
//  Copyright (c) 2013年 BJQ. All rights reserved.
//

#import "BJQViewController.h"
#import "UserModel.h"
#import "Citys.h"
@interface BJQViewController () <UITableViewDataSource>

@end

@implementation BJQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.datasArr = [UserModel shareUserModel].muarr;
    NSLog(@"====%i",[self.datasArr count]);
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datasArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"cellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifier];
    }
    Citys *acity = [[Citys alloc] init];
    acity = [self.datasArr objectAtIndex:indexPath.row];
    cell.textLabel.text = acity.cname;
    cell.detailTextLabel.text = acity.cid;
    cell.imageView.image = [UIImage imageNamed:@"city"];
    return cell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}// Default is 1 if not implemented

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section   // fixed font style. use custom view (UILabel) if you want something different
//{
//    
//}
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    
//}


- (void)dealloc
{
    [self.datasArr release];
    [super dealloc];
}

@end
