//
//  MyTableViewController.h
//  FlickrFetcher
//
//  Created by Benjamin Chen on 1/14/15.
//  Copyright (c) 2015 Benjamin Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageViewController.h"

@interface MyTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *photos; //of Flickr photo NSDictionary

- (void)prepareImageViewController:(ImageViewController *)ivc toDisplayPhoto:(NSDictionary *)photo;

@end
