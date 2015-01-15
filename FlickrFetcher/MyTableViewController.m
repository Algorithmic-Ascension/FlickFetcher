//
//  MyTableViewController.m
//  FlickrFetcher
//
//  Created by Benjamin Chen on 1/14/15.
//  Copyright (c) 2015 Benjamin Chen. All rights reserved.
//

#import "MyTableViewController.h"
#import "FlickrFetcher.h"

@implementation MyTableViewController

-(void)setPhotos:(NSArray *)photos
{
	_photos = photos;
	[self.tableView reloadData];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.photos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Flickr Photo Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	
	NSDictionary *photo = self.photos[indexPath.row];
	cell.textLabel.text = [photo valueForKeyPath:FLICKR_PHOTO_TITLE];
	cell.detailTextLabel.text = [photo valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
	
	
	
	return cell;
}

@end
