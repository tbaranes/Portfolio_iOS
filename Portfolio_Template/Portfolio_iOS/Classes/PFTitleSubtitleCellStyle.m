//
//  PFTitleSubtitleCellStyle.m
//  Portfolio_iOS
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFTitleSubtitleCellStyle.h"
#import "PFTitleSubtitleCellStyleModel.h"

@implementation PFTitleSubtitleCellStyle

#pragma mark - Data management

- (void)updateCellWithData:(id)data {
	PFTitleSubtitleCellStyleModel *model = (PFTitleSubtitleCellStyleModel *)data;
	[self.labelTitle setText:[model title]];
	[self.labelSubtitle setText:[model subtitle]];
	
}

@end
