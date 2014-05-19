//
//  PFProjectDetailsCellStyle.m
//  Portfolio_iOS
//
//  Created by Tom Baranes on 15/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFProjectDetailsCellStyle.h"
#import "PFProjectDetailsCellStyleModel.h"

@interface PFProjectDetailsCellStyle ()

#define MARGIN 10.0f
@end

@implementation PFProjectDetailsCellStyle

#pragma mark - Layout management

- (CGFloat)cellHeightWithContent:(id)content {
	PFProjectDetailsCellStyleModel *model = (PFProjectDetailsCellStyleModel *)content;

	NSString *text = [model description];
	CGSize sizeMax = CGSizeMake(floorf(CGRectGetWidth([self.labelDescription frame])), FLT_MAX);
    CGRect descriptionRect = [text boundingRectWithSize:sizeMax
												options:NSStringDrawingUsesLineFragmentOrigin
											 attributes:@{NSFontAttributeName:self.labelDescription.font}
												context:nil];
	
	CGRect frame = [self.labelDescription frame];
	frame.size.height = descriptionRect.size.height + MARGIN;
	[self.labelDescription setFrame:frame];
	
	CGRect contentRect = CGRectZero;
	for (UIView *view in self.contentView.subviews) {
		contentRect = CGRectUnion(contentRect, view.frame);
	}
	return contentRect.size.height + MARGIN * 2;
}

#pragma mark - Data management

- (void)updateCellWithData:(id)data {
	PFProjectDetailsCellStyleModel *model = (PFProjectDetailsCellStyleModel *)data;
	[self.imageIconApp setImage:[model iconApp]];
	[self.labelName setText:[model name]];
	[self.labelDescription setText:[model description]];
}

@end
