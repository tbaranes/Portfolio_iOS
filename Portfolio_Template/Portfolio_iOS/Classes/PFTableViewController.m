//
//  PFTableViewController.m
//  Portfolio_iOS
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFTableViewController.h"

@interface PFTableViewController ()

@end

@implementation PFTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[[[self.tabBarController.viewControllers objectAtIndex:0] tabBarItem] setTitle:NSLocalizedString(@"tab_bar.profile", nil)];
	[[[self.tabBarController.viewControllers objectAtIndex:1] tabBarItem] setTitle:NSLocalizedString(@"tab_bar.resume", nil)];
	[[[self.tabBarController.viewControllers objectAtIndex:2] tabBarItem] setTitle:NSLocalizedString(@"tab_bar.projects", nil)];	
}

#pragma mark - Data management

- (void)loadPlist:(NSString *)plist {
	BOOL isFR = [[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"fr"];
	NSString *plistName = [NSString stringWithFormat:@"%@_%@", plist, isFR ? @"FR" : @"EN"];
	NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType: @"plist"];
	[self createModelsFromData:[NSArray arrayWithContentsOfFile:path]];
}

- (void)createModelsFromData:(NSArray *)data {

	NSMutableArray *sections = [NSMutableArray array];
	for (NSDictionary *section in data) {
		PFSectionModel *modelSection = [[PFSectionModel alloc] initWithDictionary:section];
		[sections addObject:modelSection];
	}
	self.sectionModels = [sections copy];
	[self registerCellNibs];
}

- (void)registerCellNibs {
	for (PFSectionModel *section in self.sectionModels) {
		for (PFTableViewCellStyleModel *cellModel in [section content]) {
			[self.tableView registerNib:[UINib nibWithNibName:[cellModel cellStyle] bundle:nil] forCellReuseIdentifier:[cellModel cellIdentifier]];
		}
	}
}

#pragma mark - UITableViewSelection handler

- (void)cellSelectedActionWithModel:(id)model {
	NSString *target = [model target];
	PFCellActionOnClick clickAction = [[model valueForKey:@"clickAction"] intValue];
	switch (clickAction) {
		case MAIL: [self sendEmailWithTarget:target]; break;
		case CALL: [self callMeWithTarget:target]; break;
		case URL: [self openURLWithTarget:target]; break;
		default: break;
	}
}

#pragma mark - CellSelected Action

- (void)sendEmailWithTarget:(NSString *)target {
	if ([MFMailComposeViewController canSendMail]) {
		MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
		[mailViewController setMailComposeDelegate:self];
		[mailViewController setToRecipients:@[target]];
		[self presentViewController:mailViewController animated:YES completion:nil];
	} else {
		[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"profile.send_email.error_title", nil) message:NSLocalizedString(@"profile.send_email.error_message", nil) delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
	}
}

- (void)callMeWithTarget:(NSString *)phoneNo {
	NSURL *phoneUrl = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@", phoneNo]];
	if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
		[[UIApplication sharedApplication] openURL:phoneUrl];
	} else {
		[[[UIAlertView alloc]initWithTitle:NSLocalizedString(@"profile.send_email.error_title", nil) message:NSLocalizedString(@"profile.call.error_message", nil) delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
	}
}

- (void)openURLWithTarget:(NSString *)target {
	NSURL *url = [NSURL URLWithString:target];
	[[UIApplication sharedApplication] openURL:url];
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
