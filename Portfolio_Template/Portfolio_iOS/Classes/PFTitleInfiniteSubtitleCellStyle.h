//
//  PFTitleInfiniteSubtitleCellStyle.h
//  Portfolio_iOS
//
//  Created by Tom Baranes on 19/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import "PFTableViewCellStyle.h"

@interface PFTitleInfiniteSubtitleCellStyle : PFTableViewCellStyle

@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) NSMutableArray *subtitlesLabel;
@property (strong, nonatomic) NSMutableArray *subtitlesImage;

@end
