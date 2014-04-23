//
//  MapLoadViewController.m
//  TestMap
//
//  Created by Ion Silviu-Mihai on 22/04/14.
//  Copyright (c) 2014 sparktech. All rights reserved.
//

#import "MapLoadViewController.h"

@interface MapLoadViewController ()

@end

@implementation MapLoadViewController

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
    // Do any additional setup after loading the view.
    self.mapLocations = @[@{@"name": @"Envy Labs", //NSArray with one NSdict
                            @"lat": @28.5407,
                            @"lng": @-81.3786}
                          ];
    
    UIButton *openButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    openButton.frame = CGRectMake(20, 60, 280, 40);
    [openButton setTitle:[NSString stringWithFormat:@"Open Envy Labs in Maps"] forState:UIControlStateNormal];
    [openButton addTarget:self action:@selector(openInAppleMaps:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openButton];
    
    
    
    
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
-(void)openInAppleMaps:(id)sender
{
    double lat = [self.mapLocations[0][@"lat"] doubleValue];
    double lng = [self.mapLocations[0][@"lng"] doubleValue];
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lng);
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coord addressDictionary:nil];
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.mapLocations[0][@"name"];
    [mapItem openInMapsWithLaunchOptions:nil];
    
}

@end
