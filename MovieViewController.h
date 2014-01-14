//
//  MovieViewController.h
//  RottenTomatoes
//
//  Created by Madhukar Mulpuri on 1/13/14.
//  Copyright (c) 2014 Madhukar Mulpuri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *movieDetailsNavigationItem;
@property (nonatomic, strong) Movie *movie;
@property(nonatomic, weak) IBOutlet UIImageView *posterImageBView;
@property(nonatomic, weak) IBOutlet UILabel *movieDetailsBLabel;
@property(nonatomic, weak) IBOutlet UILabel *movieCastBLabel;
@end
