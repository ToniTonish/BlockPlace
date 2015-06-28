//
//  BlockViewController.m
//  BlockPlace
//
//  Created by Antonino Buscetta on 30/05/15.
//  Copyright (c) 2015 Tonish. All rights reserved.
//

#import "BlockViewController.h"
#import "PinViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (id)init
{
    self = [super init];
    if (self) {
        UINavigationItem *n = [self navigationItem];
        
        [n setTitle:@"Block Place"];
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector(addNewItem:)];
        [[self navigationItem] setRightBarButtonItem:bbi];
    }
    return self;
}

- (IBAction)addNewItem:(id)sender
{
    PinViewController *pvc = [[PinViewController alloc]  init];
    
    [[self navigationController] pushViewController:pvc
                                           animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"ciaociao");
    
    locationManager = [[CLLocationManager alloc] init];
    
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    
    [locationManager startUpdatingLocation];
    [worldView setShowsUserLocation:YES];
    
    
    NSLog(@"starting update");
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations lastObject];
    NSLog(@"location: %@", newLocation);
    
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    if (t < -180) {
        return;
    }
    [self foundLocation:newLocation];
    //tempLabel.text=[NSString stringWithFormat:@"%@",newLocation];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Could not find the location: %@", error);
}

- (void)dealloc
{
    // Tell the location manager to stop sending us messages.
    [locationManager setDelegate:nil];
}

- (void)mapView:(MKMapView *)mapView
didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region
                animated:YES];
}

- (void)findLocation
{
    [locationManager startUpdatingLocation];
    //[activityIndicator startAnimating];
    //[locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    // BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];
    
    //[worldView addAnnotation:mp];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    // reset UI
    // [locationTitleField setText:@""];
    //[activityIndicator stopAnimating];
    //[locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
