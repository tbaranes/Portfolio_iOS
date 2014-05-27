//
//  PFTitleInfiniteSubtitleCellStyleModel.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 19/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <MobileCoreServices/MobileCoreServices.h>
#import "PFTitleInfiniteSubtitleCellStyleModel.h"

@implementation PFTitleInfiniteSubtitleCellStyleModel

#pragma mark - Life cycle

- (id)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
		_title = [data objectForKey:@"title"];
				
		NSMutableArray *subtitles = [NSMutableArray array];
		NSMutableDictionary *subtitlesImages = [NSMutableDictionary dictionary];
		for (NSString *subtitle in [data objectForKey:@"subtitles"]) {
			CFStringRef fileExtension = (__bridge CFStringRef) [subtitle pathExtension];
			CFStringRef fileUTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExtension, NULL);
			if (UTTypeConformsTo(fileUTI, kUTTypeImage)) {
				[subtitlesImages setValue:[UIImage imageNamed:subtitle] forKey:[NSString stringWithFormat:@"%lu", (unsigned long)[subtitles count]]];
			} else {
				[subtitles addObject:subtitle];
			}
		}
		_subtitles = [subtitles copy];
		_subtitleImages = [subtitlesImages copy];
	}
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.title forKey:@"customTitle"];
    [encoder encodeObject:self.subtitleImages forKey:@"customSubtitleImages"];
    [encoder encodeObject:self.subtitles forKey:@"customSubtitles"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.title = [decoder decodeObjectForKey:@"customTitle"];
        self.subtitleImages = [decoder decodeObjectForKey:@"customSubtitleImages"];
        self.subtitles = [decoder decodeObjectForKey:@"customSubtitles"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PFTitleInfiniteSubtitleCellStyleModel *copy = [[PFTitleInfiniteSubtitleCellStyleModel allocWithZone:zone] init];
    copy->_title = [self.title copy];
    copy->_subtitles = [self.subtitles copy];
    copy->_subtitleImages = [self.subtitleImages copy];
    return copy;
}

@end
