//
//  AAAViewController.m
//  iOS-XMLDOM-demo
//
//  Created by kevin on 13-5-28.
//  Copyright (c) 2013年 BJQ. All rights reserved.
//

#import "AAAViewController.h"
#import "UserModel.h"
#import "Country.h"
@interface AAAViewController ()

@end

@implementation AAAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.datasArr = [UserModel shareUserModel].muarr_Country;
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
    Country *acountry = [[Country alloc] init];
    acountry = [self.datasArr objectAtIndex:indexPath.row];
    cell.textLabel.text = acountry.cname;
    cell.detailTextLabel.text = acountry.cid;
    cell.imageView.image = [UIImage imageNamed:@"country"];
    return cell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
