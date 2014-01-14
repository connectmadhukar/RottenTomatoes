//
//  MovieCell.h
//  RottenTomatoes
//
//  Created by Madhukar Mulpuri on 1/13/14.
//  Copyright (c) 2014 Madhukar Mulpuri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property(nonatomic, weak) IBOutlet UIImageView *posterImageView;
@property(nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property(nonatomic, weak) IBOutlet UILabel *movieDetailsLabel;
@property(nonatomic, weak) IBOutlet UILabel *movieCastLabel;
@end
