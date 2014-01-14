//
//  Movie.m
//  RottenTomatoes
//
//  Created by Madhukar Mulpuri on 1/13/14.
//  Copyright (c) 2014 Madhukar Mulpuri. All rights reserved.
//

#import "Movie.h"


@implementation Movie

- (id)initWithDictionary:(NSDictionary *) dictionary;
{
    
    self.title = [dictionary objectForKey:@"title"];
    self.synopsis = [dictionary objectForKey:@"synopsis"];
    
    NSDictionary *posters = [dictionary objectForKey:@"posters"];
    self.imageURL = [NSURL URLWithString:(NSString *) [posters objectForKey:@"thumbnail"]];
    self.detailedImageUrl  = [NSURL URLWithString:(NSString *) [posters objectForKey:@"detailed"]];
    self.cast = [[NSMutableString alloc] init];
    
    NSArray *abridgedCast = [dictionary objectForKey:@"abridged_cast"];
    for (int i = 0; i < [abridgedCast count]; i++) {
        NSString *name = [abridgedCast[i] objectForKey:@"name"];
        if (i) {
            [self.cast appendString:@","];
        }
        [self.cast appendString:name];
    }
    
    return self;
}

@end
