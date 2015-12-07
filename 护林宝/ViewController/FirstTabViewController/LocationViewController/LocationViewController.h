//
//  LocationViewController.h
//  护林宝
//
//  Created by Apple on 10/19/15.
//  Copyright © 2015 cnbin. All rights reserved.
//


#import "ReGeocodeAnnotation.h"
#import "MANaviAnnotationView.h"

#define SystemThemeColor [UIColor colorWithRed:0 green:199.0f/255.0f blue:140.0f/255.0f alpha:1.0f]

@interface LocationViewController : UIViewController<MAMapViewDelegate,AMapSearchDelegate>

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapSearchAPI *search;
@property (strong, nonatomic) NSString* date;

@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentDate;
@property (strong, nonatomic) IBOutlet UISwitch *switchButton;
@property (strong, nonatomic) IBOutlet UIView *subView;

@property (nonatomic, retain) NSString * dbPath;

@end
