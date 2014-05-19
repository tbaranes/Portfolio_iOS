//
//  PFTableViewController.h
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface PFTableViewController : UITableViewController <MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) NSArray *sectionModels;

- (void)loadPlist:(NSString *)plist;
- (void)createModelsFromData:(NSArray *)data;
- (void)cellSelectedActionWithModel:(id)model;

@end
