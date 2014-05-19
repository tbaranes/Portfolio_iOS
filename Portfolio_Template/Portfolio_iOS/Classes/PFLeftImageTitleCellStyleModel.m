//
//  PFLeftImageTitleCellStyleModel.m
//  Portfolio_iOS
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFLeftImageTitleCellStyleModel.h"

@implementation PFLeftImageTitleCellStyleModel

#pragma mark - Life cycle 

- (id)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
		_target = [data objectForKey:@"target"];
		_imageLeft = [UIImage imageNamed:[data objectForKey:@"left_image"]];
		_title = [data objectForKey:@"title"];
		
		NSDictionary *actionType = @{@"": @(NONE),
									 @"mail": @(MAIL),
									 @"call": @(CALL),
									 @"url": @(URL)};
		_clickAction = [[actionType objectForKey:[data objectForKey:@"action"]] integerValue];
	}
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInt:self.clickAction forKey:@"customClickAction"];
    [encoder encodeObject:self.target forKey:@"customTarget"];
    [encoder encodeObject:self.imageLeft forKey:@"customImageLeft"];
    [encoder encodeObject:self.title forKey:@"customTitle"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.clickAction = [decoder decodeIntForKey:@"customClickAction"];
        self.target = [decoder decodeObjectForKey:@"customTarget"];
        self.imageLeft = [decoder decodeObjectForKey:@"customImageLeft"];
        self.title = [decoder decodeObjectForKey:@"customTitle"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PFLeftImageTitleCellStyleModel *copy = [[PFLeftImageTitleCellStyleModel allocWithZone:zone] init];
    copy->_target = [self.target copy];
    copy->_title = [self.title copy];
    copy->_clickAction = self.clickAction;
    return copy;
}

@end
