//
//  PFIdentityCellStyle.h
//  Portfolio_iOS
//
//  Created by Tom Baranes on 15/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFTableViewCellStyle.h"

@interface PFIdentityCellStyle : PFTableViewCellStyle

@property (strong, nonatomic) IBOutlet UIImageView *imageProfile;
@property (strong, nonatomic) IBOutlet UILabel *text1;
@property (strong, nonatomic) IBOutlet UILabel *text2;
@property (strong, nonatomic) IBOutlet UILabel *text3;

@end
