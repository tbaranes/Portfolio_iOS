//
//  PFTitleInfiniteSubtitleCellStyleModel.h
//  Portfolio_iOS
//
//  Created by Tom Baranes on 19/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFTitleInfiniteSubtitleCellStyleModel : NSObject <NSCoding, NSCopying>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSDictionary *subtitleImages;
@property (strong, nonatomic) NSArray *subtitles;

@end
