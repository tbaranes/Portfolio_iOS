//
//  PFProjectDetailsViewController.h
//  Portfolio_iOS
//
//  Created by Tom Baranes on 15/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PFProjectCellStyleModel.h"

@interface PFProjectDetailsViewController : PFTableViewController

@property (strong, nonatomic) PFProjectCellStyleModel *project;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
