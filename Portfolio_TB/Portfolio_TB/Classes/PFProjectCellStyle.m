//
//  PFProjectCellStyle.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFProjectCellStyle.h"

@implementation PFProjectCellStyle

#pragma mark - Layout management

- (CGFloat)cellHeightWithContent:(id)content {
	return 60.0f;
}

#pragma mark - Data management

- (void)updateCellWithData:(id)data {
	PFProjectCellStyleModel *project = (PFProjectCellStyleModel *)data;
	[self setProject:project];

	[self.imageIconProject setImage:project.iconApp];
	[self.name setText:project.name];
	[self.imageIOSIcon setHidden:!project.isIOS];
	[self.imageAndroidIcon setHidden:!project.isAndroid];
}

@end
