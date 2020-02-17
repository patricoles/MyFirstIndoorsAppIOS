//
//  IDViewController.m
//  MyFirstIndoorsApp
//
//  Copyright (c) 2015 indoo.rs GmbH. All rights reserved.
//

#import "IDViewController.h"
#import <IndoorsSDK/IndoorsSDK.h>

@interface IDViewController () <IndoorsServiceDelegate, ISIndoorsSurfaceViewControllerDelegate>

@end

@implementation IDViewController {
    ISIndoorsSurfaceViewController *_indoorsSurfaceViewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Loaded View Controller");

    
    //__unused Indoors *indoors = [[Indoors alloc] initWithLicenseKey:@"65bc3b87-061d-487c-a19b-eb56cf636e02" andServiceDelegate:self]; // REPLACE WITH YOUR API KEY
    
    //_indoorsSurfaceViewController = [[ISIndoorsSurfaceViewController alloc] init];
    //_indoorsSurfaceViewController.delegate = self;
    
    //[self addSurfaceAsChildViewController];
    
   // [_indoorsSurfaceViewController loadBuildingWithBuildingId:603518600]; // REPLACE WITH YOUR BUILDING ID
}
//- (IBAction)button:(id)sender {
//    NSLog(@"Clicked Button");
//
//}

- (void)addSurfaceAsChildViewController
{
    [self addChildViewController:_indoorsSurfaceViewController];
    _indoorsSurfaceViewController.view.frame = self.view.frame;
    [self.view addSubview:_indoorsSurfaceViewController.view];
    [_indoorsSurfaceViewController didMoveToParentViewController:self];
}


#pragma mark - ISIndoorsSurfaceViewControllerDelegate

- (void)indoorsSurfaceViewController:(ISIndoorsSurfaceViewController *)indoorsSurfaceViewController isLoadingBuildingWithBuildingId:(NSUInteger)buildingId progress:(NSUInteger)progress
{
    NSLog(@"Building loading progress: %lu", (unsigned long)progress);
}

- (void)indoorsSurfaceViewController:(ISIndoorsSurfaceViewController *)indoorsSurfaceViewController didFinishLoadingBuilding:(IDSBuilding *)building
{
    NSLog(@"Building loaded successfully!");
}

- (void)indoorsSurfaceViewController:(ISIndoorsSurfaceViewController *)indoorsSurfaceViewController didFailLoadingBuildingWithBuildingId:(NSUInteger)buildingId error:(NSError *)error
{
    NSLog(@"Loading building failed with error: %@", error);
    
    [[[UIAlertView alloc] initWithTitle:error.localizedDescription message:error.localizedFailureReason delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil] show];
}

#pragma mark - IndoorsServiceDelegate

- (void)connected
{
    
}

- (void)onError:(IndoorsError *)indoorsError
{
    
}

- (void)locationAuthorizationStatusDidChange:(IDSLocationAuthorizationStatus)status
{
    
}

- (void)bluetoothStateDidChange:(IDSBluetoothState)bluetoothState
{
    
}

@end