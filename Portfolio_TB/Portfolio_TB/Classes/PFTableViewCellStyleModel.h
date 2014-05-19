//
//  PFTableViewCellStyleModel.h
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFTableViewCellStyleModel : NSObject

typedef NS_ENUM(NSInteger, PFCellActionOnClick) {
	NONE,
	MAIL,
	CALL,
	URL
};

@property (strong, nonatomic) NSString *cellStyle;
@property (strong, nonatomic) NSString *cellIdentifier;
@property (strong, nonatomic) id cellStyleModel;

- (id)initWithDictionary:(NSDictionary *)data;

@end
