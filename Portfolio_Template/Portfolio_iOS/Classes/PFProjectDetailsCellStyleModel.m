//
//  PFProjectDetailsCellStyleModel.m
//  Portfolio_iOS
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFProjectDetailsCellStyleModel.h"

@implementation PFProjectDetailsCellStyleModel

#pragma mark - Life cycle 

- (id)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
		NSString *imageName = [data objectForKey:@"icon_app"];
        _iconApp = [UIImage imageNamed:[imageName isEqualToString:@""] ? @"placeholder_icon_app" : imageName];
        _name = [data objectForKey:@"name"];
        _description = [data objectForKey:@"description"];
	}
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.iconApp forKey:@"customIconApp"];
    [encoder encodeObject:self.name forKey:@"customName"];
    [encoder encodeObject:self.description forKey:@"customDescription"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.iconApp = [decoder decodeObjectForKey:@"customIconApp"];
        self.name = [decoder decodeObjectForKey:@"customName"];
        self.description = [decoder decodeObjectForKey:@"customDescription"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PFProjectDetailsCellStyleModel *copy = [[PFProjectDetailsCellStyleModel allocWithZone:zone] init];
    copy->_iconApp = [self.iconApp copy];
    copy->_name = [self.name copy];
    copy->_description = [self.description copy];
    return copy;
}

@end
