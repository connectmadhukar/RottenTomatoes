//
//  MovieListViewController.m
//  RottenTomatoes
//
//  Created by Madhukar Mulpuri on 1/13/14.
//  Copyright (c) 2014 Madhukar Mulpuri. All rights reserved.
//

#import "MovieListViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import "MovieViewController.h"


@interface MovieListViewController ()

@property (nonatomic, strong) NSMutableArray *movies;
@property (nonatomic, strong) NSArray *moviesJsonArray;

@end

@implementation MovieListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.movies = [NSMutableArray array];
        //self.moviesJsonArray = [NSArray array];
        //[self.movies addObject:@"movie"];
        NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", object);
            self.moviesJsonArray = [object valueForKeyPath:@"movies"];
            NSArray *moviesJsonArray = [object valueForKeyPath:@"movies"];
            for(int i = 0; i < [moviesJsonArray count]; i++) {
                NSDictionary *movieDict = [moviesJsonArray objectAtIndex:i];
                
                Movie *movie = [[Movie alloc] initWithDictionary:movieDict];
                //NSLog(@" %d", [moviesJsonArray count]);
                //NSLog(@"Movies Size %d", [self.movies count]);
                [self.movies addObject:movie];
            }
            
            NSLog(@"Movies Size %d", [self.movies count]);
            [self.tableView reloadData];
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *movieCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Movie *movie = [self.movies objectAtIndex:indexPath.row];
    
    movieCell.movieTitleLabel.text = movie.title;
     NSLog(@"%@", movie.title);
    movieCell.movieDetailsLabel.text = movie.synopsis;
     //NSLog(@"%@", movie.synopsis);
     NSLog(@"%@", movie.imageURL);

    NSData * imageData = [NSData dataWithContentsOfURL:movie.imageURL];
    [movieCell.posterImageView setImage:[UIImage imageWithData:imageData]];
    
    movieCell.movieCastLabel.text = movie.cast;
     NSLog(@"%@", movie.cast);
    return movieCell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
    Movie *movie = self.movies[indexPath.row];
    
    MovieViewController *movieViewController = (MovieViewController *)segue.destinationViewController;
    movieViewController.movie = movie;
    NSLog(@"%@", movieViewController.movie.cast);
}

@end
