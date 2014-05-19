//
//  PFProjectDetailsCellStyle.h
//  Portfolio_iOS
//
//  Created by Tom Baranes on 15/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFTableViewCellStyle.h"
#import "PFProjectCellStyleModel.h"

@interface PFProjectDetailsCellStyle : PFTableViewCellStyle

@property (strong, nonatomic) IBOutlet UIImageView *imageIconApp;
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelDescription;

@end
