//
//  PFIdentityCellStyle.m
//  Portfolio_iOS
//
//  Created by Tom Baranes on 15/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFIdentityCellStyle.h"
#import "PFIdentityCellStyleModel.h"

@implementation PFIdentityCellStyle

#pragma mark - Data management

- (CGFloat)cellHeightWithContent:(id)content {
	return 110.0f;
}

#pragma mark - Layout management

- (void)updateCellWithData:(id)data {
	PFIdentityCellStyleModel *model = (PFIdentityCellStyleModel *)data;
	
	[self.imageProfile setImage:[model profilPicture]];
	[self.text1 setText:[model text1]];
	[self.text2 setText:[model text2]];
	[self.text3 setText:[model text3]];
}

@end
