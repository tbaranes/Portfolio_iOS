//
//  PFProjectViewController.m
//  Portfolio_iOS
//
//  Created by Tom Baranes on 15/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

// ViewController
#import "PFProjectViewController.h"
#import "PFProjectDetailsViewController.h"
// View
#import "PFTableViewCellStyle.h"
// Other
#import "PFProjectCellStyleModel.h"

@interface PFProjectViewController ()

@property (nonatomic, strong) PFProjectCellStyleModel *projectSelected;

@end

@implementation PFProjectViewController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setTitle:NSLocalizedString(@"tab_bar.projects", nil)];
	[self loadPlist:@"ProjectData"];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	PFSectionModel *sectionModel = [self.sectionModels objectAtIndex:indexPath.section];
	PFTableViewCellStyleModel *cellModel = [sectionModel.content objectAtIndex:indexPath.row];
	[self performSegueWithIdentifier:@"ProjectToDetailsProjectSegue" sender:[cellModel cellStyleModel]];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - NavigationController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(PFProjectCellStyleModel *)sender
{
    if ([[segue identifier] isEqualToString:@"ProjectToDetailsProjectSegue"]) {
        PFProjectDetailsViewController *vc = [segue destinationViewController];
        [vc setProject:sender];
    }
}

@end
