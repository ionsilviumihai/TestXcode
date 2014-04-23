//
//  MapViewController.h
//  TestMap
//
//  Created by Ion Silviu-Mihai on 22/04/14.
//  Copyright (c) 2014 sparktech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h> //import framework

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) MKMapView *mapView;

@property BOOL userLocationUpdated;

@property (strong, nonatomic) NSArray *mapLocations;

@end
