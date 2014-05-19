//
//  PFProjectScreenshotCellStyleModel.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFProjectScreenshotCellStyleModel.h"

@implementation PFProjectScreenshotCellStyleModel

#pragma mark - Life cycle 

- (id)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
		NSMutableArray *screenshots = [NSMutableArray array];
		for (NSString *path in [data objectForKey:@"screenshots"]) {
			UIImage *screenshot = [UIImage imageNamed:path];
			if (screenshot) {
				[screenshots addObject:screenshot];
			}
		}
		_screenshots = [screenshots copy];
	}
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.screenshots forKey:@"customScreenshots"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.screenshots = [decoder decodeObjectForKey:@"customScreenshots"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PFProjectScreenshotCellStyleModel *copy = [[PFProjectScreenshotCellStyleModel allocWithZone:zone] init];
    copy->_screenshots = [self.screenshots copy];
    return copy;
}

@end
