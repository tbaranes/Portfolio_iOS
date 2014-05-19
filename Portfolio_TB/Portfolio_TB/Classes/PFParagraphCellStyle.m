//
//  PFParagraphCellStyle.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFParagraphCellStyle.h"
#import "PFParagraphCellStyleModel.h"

@interface PFParagraphCellStyle ()

#define MARGIN 20.0f

@end

@implementation PFParagraphCellStyle

#pragma mark - Layout management

- (void)layoutSubviews {
	[super layoutSubviews];
	CGRect frame = [self.labelParagraph frame];
	frame.size.height = self.frame.size.height - MARGIN;
	[self.labelParagraph setFrame:frame];
}

- (CGFloat)cellHeightWithContent:(id)content {
	PFParagraphCellStyleModel *model = (PFParagraphCellStyleModel *)content;
	NSString *text = [model text];
	
	CGSize sizeMax = CGSizeMake(floorf(CGRectGetWidth([self.labelParagraph frame])), FLT_MAX);
    CGRect descriptionRect = [text boundingRectWithSize:sizeMax
												options:NSStringDrawingUsesLineFragmentOrigin
											 attributes:@{NSFontAttributeName:[self.labelParagraph font]}
												context:nil];
	
	return descriptionRect.size.height + MARGIN;
}

#pragma mark - Data management

- (void)updateCellWithData:(id)data {
	PFParagraphCellStyleModel *model = (PFParagraphCellStyleModel *)data;
	[self.labelParagraph setText:[model text]];
}

@end
