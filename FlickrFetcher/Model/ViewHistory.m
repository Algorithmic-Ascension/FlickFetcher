//
//  History.m
//  FlickrFetcher
//
//  Created by Benjamin Chen on 1/19/15.
//  Copyright (c) 2015 Benjamin Chen. All rights reserved.
//

#import "ViewHistory.h"

@implementation ViewHistory

//TODO: place into file of constants
static const int VIEW_HISTORY_CAPACITY = 20;

- (instancetype) init {
	self = [super initWithCapacity:VIEW_HISTORY_CAPACITY];
	return self;
}

//enforce capacity
- (void) addObject:(id)object {
	if(self.count > VIEW_HISTORY_CAPACITY){
		[self removeObjectAtIndex:self.count];
	}
	[super addObject:object];
}

@end
