//
//  PFProjectCellStyleModel.h
//  Portfolio_TB
//
//  Created by Tom Baranes on 15/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFProjectCellStyleModel : NSObject

@property (nonatomic) BOOL isIOS;
@property (nonatomic) BOOL isAndroid;
@property (strong, nonatomic) UIImage *iconApp;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *projectDetails;

@end
