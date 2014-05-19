//
//  PFRightDetailCellStyleModel.m
//  Portfolio_iOS
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFRightDetailCellStyleModel.h"

@implementation PFRightDetailCellStyleModel

#pragma mark - Life cycle 

- (id)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
		_target = [data objectForKey:@"target"];
		_text = [data objectForKey:@"left_text"];
		_detailText = [data objectForKey:@"right_text"];

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
    [encoder encodeObject:self.text forKey:@"customText"];
    [encoder encodeObject:self.detailText forKey:@"customDetailText"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.clickAction = [decoder decodeIntForKey:@"customClickAction"];
        self.target = [decoder decodeObjectForKey:@"customTarget"];
        self.text = [decoder decodeObjectForKey:@"customText"];
        self.detailText = [decoder decodeObjectForKey:@"customDetailText"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PFRightDetailCellStyleModel *copy = [[PFRightDetailCellStyleModel allocWithZone:zone] init];
    copy->_target = [self.target copy];
    copy->_text = [self.text copy];
    copy->_detailText = [self.detailText copy];
    copy->_clickAction = self.clickAction;
    return copy;
}

@end
