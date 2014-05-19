//
//  PFProjectScreenshotCellStyle.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 15/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFProjectScreenshotCellStyle.h"
#import "PFProjectScreenshotCellStyleModel.h"

@interface PFProjectScreenshotCellStyle ()

@property (strong, nonatomic) NSArray *screenshots;

@end

@implementation PFProjectScreenshotCellStyle

#define MARGIN 10.0f

#pragma mark - Layout management

- (CGFloat)cellHeightWithContent:(id)content {
	PFProjectScreenshotCellStyleModel *model = (PFProjectScreenshotCellStyleModel *)content;
	return [self findBiggestHeightForArray:[model screenshots]];
}

- (CGFloat)findBiggestHeightForArray:(NSArray *)images {
	NSInteger biggestImage = 0.f;
	for (UIImage *image in images) {
		if (biggestImage < image.size.height) {
			biggestImage = image.size.height +  MARGIN * 2;
		}
	}
	return biggestImage;
}

#pragma mark - Data management

- (void)updateCellWithData:(id)data {
	PFProjectScreenshotCellStyleModel *model = (PFProjectScreenshotCellStyleModel *)data;
	self.screenshots = [model screenshots];
	[self createCarousel];
}

- (void)createCarousel {
	
	NSInteger x = MARGIN;
	NSInteger biggestImage = [self findBiggestHeightForArray:self.screenshots];
	for (UIImage *image in self.screenshots) {
		NSInteger y = biggestImage / 2 - image.size.height / 2;
		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
		[imageView setFrame:CGRectMake(x, y, 0, 0)];
		[imageView sizeToFit];
		
		[self.scrollView addSubview:imageView];
		x += image.size.width + MARGIN;
	}
	
	[self.scrollView setContentSize:CGSizeMake(x, floorf(CGRectGetHeight([self.scrollView bounds])))];
}

@end
