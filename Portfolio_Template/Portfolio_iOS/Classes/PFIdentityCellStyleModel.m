//
//  PFIdentityCellStyleModel.m
//  Portfolio_iOS
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFIdentityCellStyleModel.h"

@implementation PFIdentityCellStyleModel

#pragma mark - Life cycle

- (id)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
		_profilPicture = [UIImage imageNamed:[data objectForKey:@"picture"]];
		_text1 = [data objectForKey:@"text1"];
		_text2 = [data objectForKey:@"text2"];
		_text3 = [data objectForKey:@"text3"];
    }
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.profilPicture forKey:@"customProfilPicture"];
    [encoder encodeObject:self.text1 forKey:@"customText1"];
    [encoder encodeObject:self.text2 forKey:@"customText2"];
    [encoder encodeObject:self.text3 forKey:@"customText3"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.profilPicture = [decoder decodeObjectForKey:@"customProfilPicture"];
        self.text1 = [decoder decodeObjectForKey:@"customText1"];
        self.text2 = [decoder decodeObjectForKey:@"customText2"];
        self.text3 = [decoder decodeObjectForKey:@"customText3"];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    PFIdentityCellStyleModel *copy = [[PFIdentityCellStyleModel allocWithZone:zone] init];
    copy->_profilPicture = [self.profilPicture copy];
    copy->_text1 = [self.text1 copy];
    copy->_text2 = [self.text2 copy];
    copy->_text3 = [self.text3 copy];
    return copy;
}

@end
