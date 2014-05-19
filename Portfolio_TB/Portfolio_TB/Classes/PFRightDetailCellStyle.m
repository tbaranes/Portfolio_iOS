//
//  PFRightDetailCellStyle.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFRightDetailCellStyle.h"
#import "PFRightDetailCellStyleModel.h"

@implementation PFRightDetailCellStyle

#pragma mark - Data management

- (void)updateCellWithData:(id)data {
	PFRightDetailCellStyleModel *model = (PFRightDetailCellStyleModel *)data;
	[self.labelText setText:[model text]];
	[self.labelDetailsText setText:[model detailText]];
	
	[self setSelectionStyle:[model clickAction] == NONE ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault];
	[self setAccessoryType:[model clickAction] == NONE ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator];
}

@end
