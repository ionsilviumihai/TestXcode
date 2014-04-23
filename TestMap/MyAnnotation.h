//
//  MyAnnotation.h
//  TestMap
//
//  Created by Ion Silviu-Mihai on 22/04/14.
//  Copyright (c) 2014 sparktech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation>

@property CLLocationCoordinate2D coordinate;
@property (weak, nonatomic) NSString *title;
@property (weak, nonatomic) NSString *subtitle;

@end
