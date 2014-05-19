//
//  PFTableViewCellStyle.h
//  Portfolio_TB
//
//  Created by Tom Baranes on 18/05/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFTableViewCellStyle : UITableViewCell

- (CGFloat)cellHeightWithContent:(id)content;
- (void)updateCellWithData:(id)data;

@end
