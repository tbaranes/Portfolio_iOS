//
//  PFLeftImageTitleCellStyleModel.h
//  Portfolio_iOS
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFLeftImageTitleCellStyleModel : NSObject

@property (nonatomic) PFCellActionOnClick clickAction;
@property (strong, nonatomic) NSString *target;
@property (strong, nonatomic) UIImage *imageLeft;
@property (strong, nonatomic) NSString *title;

@end
