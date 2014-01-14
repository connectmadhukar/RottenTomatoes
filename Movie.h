//
//  Movie.h
//  RottenTomatoes
//
//  Created by Madhukar Mulpuri on 1/13/14.
//  Copyright (c) 2014 Madhukar Mulpuri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSMutableString *cast;
@property (nonatomic, strong) NSURL *detailedImageUrl;
- (id)initWithDictionary:(NSDictionary *) dictionary;

@end
