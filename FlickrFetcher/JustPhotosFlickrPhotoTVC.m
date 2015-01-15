//
//  JustPhotosFlickrPhotoTVC.m
//  FlickrFetcher
//
//  Created by Benjamin Chen on 1/14/15.
//  Copyright (c) 2015 Benjamin Chen. All rights reserved.
//

#import "JustPhotosFlickrPhotoTVC.h"
#import "FlickrFetcher.h"

@implementation JustPhotosFlickrPhotoTVC

- (void) viewDidLoad
{
	[super viewDidLoad];
	[self fetchPhotos];
}

-(void) fetchPhotos
{
	NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
#warning Blacking Main Thread
	NSData *jsonResults = [NSData dataWithContentsOfURL:url];
	NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults
																		options:0
																		  error:NULL];
	NSLog(@"Flickr results = %@", propertyListResults);
	NSArray *photos = [propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
	self.photos = photos;
}

@end
