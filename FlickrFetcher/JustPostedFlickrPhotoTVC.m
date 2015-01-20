//
//  JustPhotosFlickrPhotoTVC.m
//  FlickrFetcher
//
//  Created by Benjamin Chen on 1/14/15.
//  Copyright (c) 2015 Benjamin Chen. All rights reserved.
//

#import "JustPostedFlickrPhotoTVC.h"
#import "FlickrFetcher.h"

@implementation JustPostedFlickrPhotoTVC

- (void)viewDidLoad {
	[super viewDidLoad];
	[self fetchPhotos];
}

- (void)fetchPhotos {
	NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
		NSData *jsonResults = [NSData dataWithContentsOfURL:url];
		
		NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults
																			options:0
																			  error:NULL];
		NSArray *photos = [propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
		dispatch_async(dispatch_get_main_queue(), ^{
			self.photos = photos;
		});
	});
}

@end
