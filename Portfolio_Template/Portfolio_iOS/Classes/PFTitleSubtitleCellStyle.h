//
//  PFTitleSubtitleCellStyle.h
//  Portfolio_iOS
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFTableViewCellStyle.h"

@interface PFTitleSubtitleCellStyle : PFTableViewCellStyle

@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelSubtitle;

@end
