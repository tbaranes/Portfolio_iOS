//
//  PFProjectCellStyleModel.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 15/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFProjectCellStyleModel.h"

@implementation PFProjectCellStyleModel

#pragma mark - Life cycle 

- (id)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
		NSString *imageName = [data objectForKey:@"icon_app"];
        _iconApp = [UIImage imageNamed:[imageName isEqualToString:@""] ? @"placeholder_icon_app" : imageName];
        _isIOS = [[data objectForKey:@"is_ios"] boolValue];
        _isAndroid = [[data objectForKey:@"is_android"] boolValue];
        _name = [data objectForKey:@"name"];
		_projectDetails = [data objectForKey:@"details_record"];
	}
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeBool:self.isIOS forKey:@"customIOS"];
    [encoder encodeBool:self.isAndroid forKey:@"customAndroid"];
    [encoder encodeObject:self.iconApp forKey:@"customIconApp"];
    [encoder encodeObject:self.name forKey:@"customName"];
    [encoder encodeObject:self.projectDetails forKey:@"customProjectDetails"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.isIOS = [decoder decodeBoolForKey:@"customIOS"];
        self.isAndroid = [decoder decodeBoolForKey:@"customAndroid"];
        self.iconApp = [decoder decodeObjectForKey:@"customIconApp"];
        self.name = [decoder decodeObjectForKey:@"customName"];
        self.projectDetails = [decoder decodeObjectForKey:@"customProjectDetails"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PFProjectCellStyleModel *copy = [[PFProjectCellStyleModel allocWithZone:zone] init];
    copy->_iconApp = [self.iconApp copy];
    copy->_isIOS = self.isIOS;
    copy->_isAndroid = self.isAndroid;
    copy->_name = [self.name copy];
    copy->_projectDetails = [self.projectDetails copy];
    return copy;
}

@end
