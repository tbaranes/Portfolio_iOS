//
//  PFProjectCellStyle.h
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFTableViewCellStyle.h"
#import "PFProjectCellStyleModel.h"

@interface PFProjectCellStyle : PFTableViewCellStyle

@property (strong, nonatomic) PFProjectCellStyleModel *project;

@property (strong, nonatomic) IBOutlet UIImageView *imageIconProject;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIImageView *imageIOSIcon;
@property (strong, nonatomic) IBOutlet UIImageView *imageAndroidIcon;

@end
