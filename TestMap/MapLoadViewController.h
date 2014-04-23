//
//  MapLoadViewController.h
//  TestMap
//
//  Created by Ion Silviu-Mihai on 22/04/14.
//  Copyright (c) 2014 sparktech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapLoadViewController : UIViewController

@property (strong, nonatomic) NSArray *mapLocations;

- (void)openInAppleMaps:(id)sender;


@end
