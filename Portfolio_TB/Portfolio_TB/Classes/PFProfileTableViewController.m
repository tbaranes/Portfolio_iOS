//
//  PFProfileTableViewController.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 14/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFProfileTableViewController.h"
// View
#import "PFIdentityCellStyle.h"

@interface PFProfileTableViewController ()

@end

@implementation PFProfileTableViewController

#pragma mark - Life cycle 

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setTitle:NSLocalizedString(@"tab_bar.profile", nil)];
	[self loadPlist:@"ProfileData"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sectionModels count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	PFSectionModel *sectionModel = [self.sectionModels objectAtIndex:section];
    return [[sectionModel content] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

	PFSectionModel *sectionModel = [self.sectionModels objectAtIndex:indexPath.section];
	PFTableViewCellStyleModel *cellModel = [sectionModel.content objectAtIndex:indexPath.row];
    PFTableViewCellStyle *cell = [tableView dequeueReusableCellWithIdentifier:[cellModel cellIdentifier]];
	return [cell cellHeightWithContent:[cellModel cellStyleModel]];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [[self.sectionModels objectAtIndex:section] sectionName];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	PFSectionModel *sectionModel = [self.sectionModels objectAtIndex:indexPath.section];
	PFTableViewCellStyleModel *cellModel = [sectionModel.content objectAtIndex:indexPath.row];
    PFTableViewCellStyle *cell = [tableView dequeueReusableCellWithIdentifier:[cellModel cellIdentifier]];
	[cell updateCellWithData:[cellModel cellStyleModel]];
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	PFSectionModel *sectionModel = [self.sectionModels objectAtIndex:indexPath.section];
	id model = [[sectionModel.content objectAtIndex:indexPath.row] cellStyleModel];
    if (![model respondsToSelector:NSSelectorFromString(@"clickAction")] ||
		[[model valueForKey:@"clickAction"] intValue] == NONE) {
		return nil;
	}
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	PFSectionModel *sectionModel = [self.sectionModels objectAtIndex:indexPath.section];
	id model = [[sectionModel.content objectAtIndex:indexPath.row] cellStyleModel];
	[self cellSelectedActionWithModel:model];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
