//
//  MyTableViewController.m
//  FlickrFetcher
//
//  Created by Benjamin Chen on 1/14/15.
//  Copyright (c) 2015 Benjamin Chen. All rights reserved.
//

#import "MyTableViewController.h"
#import "FlickrFetcher.h"
#import "ImageViewController.h"

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
	return self.photos.count;
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

- (void)prepareImageViewController:(ImageViewController *)ivc toDisplayPhoto:(NSDictionary *)photo;
{
	ivc.imageURL = [FlickrFetcher URLforPhoto:photo format:FlickrPhotoFormatLarge];
	ivc.title = [photo valueForKeyPath:FLICKR_PHOTO_TITLE];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if([sender isKindOfClass:[UITableViewCell class]]){
		NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
		if (indexPath) {
			if ([segue.identifier isEqualToString:@"Display Photo"]) {
				if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
					[self prepareImageViewController:segue.destinationViewController
									  toDisplayPhoto:self.photos[indexPath.row]];
				}
			}
		}
	}
}

@end
