//
//  PFSectionModel.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFSectionModel.h"
#import "PFTableViewCellStyleModel.h"

@implementation PFSectionModel

#pragma mark - Life cycle 

- (id)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
		_sectionName = [data objectForKey:@"section_name"];

		NSMutableArray *finalContent = [NSMutableArray array];
		for (NSDictionary *content in [data objectForKey:@"content"]) {
			PFTableViewCellStyleModel *model = [[PFTableViewCellStyleModel alloc] initWithDictionary:content];
			[finalContent addObject:model];
		}		
		_content = [finalContent copy];
    }
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.sectionName forKey:@"customSectionName"];
    [encoder encodeObject:self.content forKey:@"customContent"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.sectionName = [decoder decodeObjectForKey:@"customSectionName"];
        self.content = [decoder decodeObjectForKey:@"customContent"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PFSectionModel *copy = [[PFSectionModel allocWithZone:zone] init];
    copy->_sectionName = [self.sectionName copy];
    copy->_content = [self.content copy];
    return copy;
}

@end
