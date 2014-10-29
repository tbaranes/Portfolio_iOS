//
//  PFTitleInfiniteSubtitleCellStyle.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 19/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFTitleInfiniteSubtitleCellStyle.h"
#import "PFTitleInfiniteSubtitleCellStyleModel.h"

@interface PFTitleInfiniteSubtitleCellStyle ()

#define MARGIN 7.0f
#define IMAGE_SIZE 16.0f

@end

@implementation PFTitleInfiniteSubtitleCellStyle

#pragma mark - 

- (void)awakeFromNib {
	[super awakeFromNib];
	self.subtitlesLabel = [NSMutableArray array];
	self.subtitlesImage = [NSMutableArray array];
}


#pragma mark - Layout management

- (CGFloat)heightForText:(NSString *)text hasAnImage:(BOOL)hasAnImage {
	UIFont *font = [UIFont fontWithName:nil size:12.0f];
	NSInteger widthMax = floorf(CGRectGetWidth([self.labelTitle frame]));
	if (hasAnImage) {
		widthMax -= IMAGE_SIZE - MARGIN;
	}
	CGSize sizeMax = CGSizeMake(widthMax, FLT_MAX);
	CGRect frame = [text boundingRectWithSize:sizeMax
									  options:NSStringDrawingUsesLineFragmentOrigin
								   attributes:@{NSFontAttributeName:font}
									  context:nil];
	return frame.size.height;
}

- (CGFloat)cellHeightWithContent:(id)content {
	PFTitleInfiniteSubtitleCellStyleModel *model = (PFTitleInfiniteSubtitleCellStyleModel *)content;
	NSInteger idx = 0;
	NSInteger totHeight = floor(CGRectGetHeight([self.labelTitle bounds])) + MARGIN;
	for (NSString *text in [model subtitles]) {
		BOOL hasAnImage = [model.subtitleImages objectForKey:[NSString stringWithFormat:@"%ld", (long)idx]] != nil;
		totHeight += [self heightForText:text hasAnImage:hasAnImage] + MARGIN;
		idx++;
	}
	return totHeight + MARGIN;
}

#pragma mark - Data management

- (void)hideAllSubviews {
	for (NSInteger idx = 0; idx < [self.subtitlesLabel count] || idx < [self.subtitlesImage count]; ++idx) {
		if (idx < [self.subtitlesLabel count]) {
			[[self.subtitlesLabel objectAtIndex:idx] setHidden:YES];
		}
		if (idx < [self.subtitlesImage count]) {
			[[self.subtitlesImage objectAtIndex:idx] setHidden:YES];
		}
	}
}

- (void)reuseSubtitleImage:(UIImage *)image nextY:(NSInteger)nextY idx:(NSInteger)idx {
	UIImageView *imageView = [self.subtitlesImage count] <= idx ? [UIImageView new] : [self.subtitlesImage objectAtIndex:idx];
	[imageView setImage:image];
	[imageView setHidden:NO];
	
	CGRect frame = CGRectMake(0, 0, IMAGE_SIZE, IMAGE_SIZE);
	frame.origin.x = floorf(CGRectGetMinX([self.labelTitle frame]));
	frame.origin.y = nextY;
	[imageView setFrame:frame];

	if ([self.subtitlesImage count] <= idx) {
		[self addSubview:imageView];
		[self.subtitlesImage addObject:imageView];
	}
}

- (UILabel *)reuseLabelWithText:(NSString *)text nextY:(NSInteger)nextY hasAnImage:(BOOL)hasAnImage idx:(NSInteger)idx {
	UILabel *label = [self.subtitlesLabel count] <= idx ? [UILabel new] : [self.subtitlesLabel objectAtIndex:idx];
	[label setHidden:NO];
	[label setText:text];
	[label setNumberOfLines:0];
	[label setTextColor:[UIColor blackColor]];
	[label setFont:[UIFont fontWithName:nil size:12.0f]];
	
	CGRect frame = [self.labelTitle frame];
	frame.size.height = [self heightForText:text hasAnImage:hasAnImage];
	if (hasAnImage) {
		frame.origin.x += IMAGE_SIZE + MARGIN;
	}
	frame.origin.y = nextY;
	[label setFrame:frame];
	
	if ([self.subtitlesLabel count] <= idx) {
		[self addSubview:label];
		[self.subtitlesLabel addObject:label];
	}
	return label;
}

- (void)updateCellWithData:(id)data {
	PFTitleInfiniteSubtitleCellStyleModel *model = (PFTitleInfiniteSubtitleCellStyleModel *)data;
	[self.labelTitle setText:[model title]];
	[self hideAllSubviews];

	NSInteger idx = 0;
	NSInteger nextY = floorf(CGRectGetMaxY([self.labelTitle frame])) + MARGIN;
	for (NSString *text in [model subtitles]) {
		UIImage *image = [model.subtitleImages objectForKey:[NSString stringWithFormat:@"%ld", (long)idx]];
		if (image) {
			[self reuseSubtitleImage:image nextY:nextY idx:idx];
		}
		UILabel *nextLabel = [self reuseLabelWithText:text nextY:nextY hasAnImage:image != nil idx:idx];
		[self addSubview:nextLabel];
		nextY += floorf(CGRectGetHeight([nextLabel bounds])) + MARGIN;
		idx++;
	}
}

@end
