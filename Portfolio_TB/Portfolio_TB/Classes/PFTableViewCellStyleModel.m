//
//  PFTableViewCellStyleModel.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFTableViewCellStyleModel.h"

@implementation PFTableViewCellStyleModel

#pragma mark - Life cycle 

- (id)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
		_cellStyle = [data objectForKey:@"cell_style"];
		_cellIdentifier = [data objectForKey:@"cell_style"];
		
		NSString *modelName = [_cellStyle stringByAppendingString:@"Model"];
		NSDictionary *modelContent = [data objectForKey:@"content"];
		_cellStyleModel = [[NSClassFromString(modelName) alloc] initWithDictionary:modelContent];
    }
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.cellStyle forKey:@"customCellStyle"];
    [encoder encodeObject:self.cellIdentifier forKey:@"customCellIdentifier"];
    [encoder encodeObject:self.cellStyleModel forKey:@"customCellStyleModel"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.cellStyle = [decoder decodeObjectForKey:@"customCellStyle"];
        self.cellIdentifier = [decoder decodeObjectForKey:@"customCellIdentifier"];
        self.cellStyleModel = [decoder decodeObjectForKey:@"customCellStyleModel"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PFTableViewCellStyleModel *copy = [[PFTableViewCellStyleModel allocWithZone:zone] init];
    copy->_cellStyle = [self.cellStyle copy];
    copy->_cellIdentifier = [self.cellIdentifier copy];
    copy->_cellStyleModel = [self.cellStyleModel copy];
    return copy;
}

@end
