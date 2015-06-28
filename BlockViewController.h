//
//  BlockViewController.h
//  BlockPlace
//
//  Created by Antonino Buscetta on 30/05/15.
//  Copyright (c) 2015 Tonish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BlockViewController : UIViewController <CLLocationManagerDelegate,  MKMapViewDelegate>
{
    CLLocationManager *locationManager;
    IBOutlet MKMapView *worldView;
}

- (void)findLocation;
- (void)foundLocation: (CLLocation *)loc;

- (IBAction)addNewItem:(id)sender;

@end
