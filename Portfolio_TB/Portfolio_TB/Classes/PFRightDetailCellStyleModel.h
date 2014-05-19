//
//  PFRightDetailCellStyleModel.h
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFRightDetailCellStyleModel : NSObject

@property (nonatomic) PFCellActionOnClick clickAction;
@property (strong, nonatomic) NSString *target;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *detailText;

@end
