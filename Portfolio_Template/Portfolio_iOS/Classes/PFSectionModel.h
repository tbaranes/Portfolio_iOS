//
//  PFSectionModel.h
//  Portfolio_iOS
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFSectionModel : NSObject <NSCoding, NSCopying>

@property (strong, nonatomic) NSString *sectionName;
@property (strong, nonatomic) NSArray *content;

- (id)initWithDictionary:(NSDictionary *)data;

@end
