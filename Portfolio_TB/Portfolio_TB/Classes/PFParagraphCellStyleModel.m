//
//  PFParagraphCellStyleModel.m
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFParagraphCellStyleModel.h"

@implementation PFParagraphCellStyleModel

#pragma mark - Life cycle

- (id)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
		_text = [data objectForKey:@"text"];
    }
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.text forKey:@"customText"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.text = [decoder decodeObjectForKey:@"customText"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PFParagraphCellStyleModel *copy = [[PFParagraphCellStyleModel allocWithZone:zone] init];
    copy->_text = [self.text copy];
    return copy;
}

@end
