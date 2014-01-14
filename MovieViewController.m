//
//  MovieViewController.m
//  RottenTomatoes
//
//  Created by Madhukar Mulpuri on 1/13/14.
//  Copyright (c) 2014 Madhukar Mulpuri. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
     }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.movieDetailsNavigationItem.title = self.movie.title;
    self.movieDetailsBLabel.text = self.movie.synopsis;
    NSData * imageData = [NSData dataWithContentsOfURL:self.movie.detailedImageUrl];
    [self.posterImageBView setImage:[UIImage imageWithData:imageData]];
    self.movieCastBLabel.text = self.movie.cast;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
