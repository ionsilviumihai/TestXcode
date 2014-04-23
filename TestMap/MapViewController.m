//
//  MapViewController.m
//  TestMap
//
//  Created by Ion Silviu-Mihai on 22/04/14.
//  Copyright (c) 2014 sparktech. All rights reserved.
//

#import "MapViewController.h"
#import "MyAnnotation.h"


@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *locations = @[
                        @{@"name": @"Lake Eola",
                          @"lat": @28.544192,
                          @"lng": @-82.373286},
                        @{@"name": @"Lake Lawsona",
                          @"lat": @28.540875,
                          @"lng": @-81.364317},
                        @{@"name": @"Lake Lucerne",
                          @"lat": @28.534616,
                          @"lng": @-81.378179}
                        ];
    
    for (NSDictionary *location in locations) {
        CLLocationCoordinate2D annotationCoordinate = CLLocationCoordinate2DMake([location[@"lat"] doubleValue], [location[@"lng"] doubleValue]);
        MyAnnotation *annotation = [[MyAnnotation alloc] init];
        annotation.coordinate = annotationCoordinate;
        annotation.title = location[@"name"];
        annotation.subtitle = nil;
        [self.mapView addAnnotation:annotation];
    }
    
    //crearea unui patrat pentru spam cu cele 3 locatii
    NSMutableArray *lats = [[NSMutableArray alloc] init];
    NSMutableArray *lngs = [[NSMutableArray alloc] init];
    
    for (NSDictionary *location in locations) {
        [lats addObject:[NSNumber numberWithDouble:[location[@"lat"] doubleValue]]];
        [lngs addObject:[NSNumber numberWithDouble:[location[@"lng"] doubleValue]]];
    }
    [lats sortUsingSelector:@selector(compare:)];
    [lngs sortUsingSelector:@selector(compare:)];
    double smallestLat = [lats[0] doubleValue];
    double smallestLng = [lngs[0] doubleValue];
    double biggestLat = [[lats lastObject] doubleValue];
    double biggestLng = [[lngs lastObject] doubleValue];
    CLLocationCoordinate2D annotationCenter = CLLocationCoordinate2DMake((biggestLat + smallestLat) / 2, (biggestLng + smallestLng) / 2);
    
    
    
    self.userLocationUpdated  = NO;
    
    
    // Do any additional setup after loading the view.
    
    self.mapView = [[MKMapView alloc] init];
    self.mapView.frame = CGRectMake(0,
                                    0,
                                    self.view.bounds.size.width,
                                    self.view.bounds.size.height);
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    
    self.mapView.showsUserLocation = YES;
    //[self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES]; - NU MERGE PENTRU CA NU IA LOCATIA INSTANT SI VOM SETA O LOCATIE CARE INCA NU E STIUTA DE DEVICE
    
    //setting a region
    
    //CLLocationCoordinate2D startCenter = CLLocationCoordinate2DMake(28.5407, -81.3786);
    //CLLocationDistance regionWidth = 1500;
    //CLLocationDistance regionHeight = 1500;
    
    //MKCoordinateRegion startRegion = MKCoordinateRegionMakeWithDistance(startCenter, regionWidth, regionHeight);
    //[self.mapView setRegion:startRegion animated:YES];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    if(!self.userLocationUpdated)
    {
        //[self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
        self.userLocationUpdated = YES;
        
        //CLLocationCoordinate2D startCenter = CLLocationCoordinate2DMake(28.5407, -81.3786);
        CLLocationDistance regionWidth = 1500; //meters
        CLLocationDistance regionHeight = 1500;
        
        MKCoordinateRegion startRegion = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.location.coordinate  , regionWidth, regionHeight);
        [self.mapView setRegion:startRegion animated:YES];
        
        //adding an annotation object
        CLLocationCoordinate2D annotationCoordinate = CLLocationCoordinate2DMake(self.mapView.userLocation.location.coordinate.latitude, self.mapView.userLocation.location.coordinate.longitude);
        MyAnnotation *annotation = [[MyAnnotation alloc] init];
        annotation.coordinate = annotationCoordinate;
        annotation.title  = @"Sparktech";
        annotation.subtitle = @"Working hard";
        [self.mapView addAnnotation:annotation];
        //[self.mapView setCenterCoordinate:annotation animated:YES];
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    /*if([annotation isKindOfClass:[MKUserLocation class]]) // if that is the blue dot dont try to display nything:).
    {
        return nil;
    }
    */
    MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];
    if(!view) {
        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annoView"];
    }
    
    //UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    //imgView.image = [UIImage imageNamed:@"pinicon"]
    view.image = [UIImage imageNamed:@"pinicon2"]; //modified
    view.canShowCallout = YES;
    
    return view;
}

@end
