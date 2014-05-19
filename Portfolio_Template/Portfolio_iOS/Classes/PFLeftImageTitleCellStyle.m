//
//  PFLeftImageTitleCellStyle.m
//  Portfolio_iOS
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFLeftImageTitleCellStyle.h"
#import "PFLeftImageTitleCellStyleModel.h"

@implementation PFLeftImageTitleCellStyle

#pragma mark - Data management

- (void)updateCellWithData:(id)data {
	PFLeftImageTitleCellStyleModel *model = (PFLeftImageTitleCellStyleModel *)data;
	[self.leftImage setImage:[model imageLeft]];
	[self.labelName setText:[model title]];
}

@end
