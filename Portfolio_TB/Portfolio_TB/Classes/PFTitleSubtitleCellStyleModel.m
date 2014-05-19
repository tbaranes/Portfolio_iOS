//
//  PFTitleSubtitleCellStyleModel.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFTitleSubtitleCellStyleModel.h"

@implementation PFTitleSubtitleCellStyleModel

#pragma mark - Life cycle 

- (id)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
		_title = [data objectForKey:@"title"];
		_subtitle = [data objectForKey:@"subtitle"];
	}
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.title forKey:@"customTitle"];
    [encoder encodeObject:self.subtitle forKey:@"customSubtitle"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.title = [decoder decodeObjectForKey:@"customTitle"];
        self.subtitle = [decoder decodeObjectForKey:@"customSubtitle"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PFTitleSubtitleCellStyleModel *copy = [[PFTitleSubtitleCellStyleModel allocWithZone:zone] init];
    copy->_title = [self.title copy];
    copy->_subtitle = [self.subtitle copy];
    return copy;
}

@end
