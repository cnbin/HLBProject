//
//  LocationViewController.m
//  护林宝
//
//  Created by Apple on 10/19/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"定位通";

    [_switchButton addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_switchButton];
    [MAMapServices sharedServices].apiKey = @"7f7d305790ec14414e68dcb64c0fa3f0";
    [AMapSearchServices sharedServices].apiKey = @"7f7d305790ec14414e68dcb64c0fa3f0";
    
//    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
//    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
//    _date = [formatter stringFromDate:[NSDate date]];
//    _currentDate.text = _date;
    
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.subView.bounds), CGRectGetHeight(self.subView.bounds))];
    _mapView.delegate = self;
    [self.subView addSubview:_mapView];
    _mapView.showsUserLocation = YES; //YES 为打开定位,NO 为关闭定位
    
}

//实现逆地理编码的回调函数
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if (response.regeocode != nil)
    {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(request.location.latitude, request.location.longitude);
        //添加一根针
        ReGeocodeAnnotation *reGeocodeAnnotation = [[ReGeocodeAnnotation alloc] initWithCoordinate:coordinate
                                                                                         reGeocode:response.regeocode];
        _locationLabel.text = response.regeocode.formattedAddress;
        
        [self.mapView addAnnotation:reGeocodeAnnotation];//要添加标注
        [self.mapView selectAnnotation:reGeocodeAnnotation animated:YES];//标注是否有动画效果
    }
}

#pragma mark - 自动登录
-(void)switchAction:(UISwitch *)ActionSwitch{
    BOOL isButtonOn=[ActionSwitch isOn];
    if (isButtonOn) {
        
        NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
        _date = [formatter stringFromDate:[NSDate date]];
        _currentDate.text = _date;
        
        //初始化检索对象
        _search = [[AMapSearchAPI alloc] init];
        _search.delegate = self;
        
        MAUserLocation * userLocat = self.mapView.userLocation;
        AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
        
        regeo.location = [AMapGeoPoint locationWithLatitude:userLocat.coordinate.latitude longitude:userLocat.coordinate.longitude];
        regeo.requireExtension = YES;
//        _locationLabel.text =nil;
        //发起逆地理编码
        [self.search AMapReGoecodeSearch:regeo];
        
        NSLog(@"userLocat.coordinate.latitude is %lf",userLocat.coordinate.latitude);
        NSLog(@"userLocat.coordinate.latitude is %lf",userLocat.coordinate.longitude);

  }
        
    else{
        _currentDate.text = nil;
        _mapView.showsUserLocation = NO;
        
    }
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[ReGeocodeAnnotation class]])
    {
        static NSString *invertGeoIdentifier = @"invertGeoIdentifier";
        
        MANaviAnnotationView *poiAnnotationView = (MANaviAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:invertGeoIdentifier];
        if (poiAnnotationView == nil)
        {
            poiAnnotationView = [[MANaviAnnotationView alloc] initWithAnnotation:annotation
                                                                 reuseIdentifier:invertGeoIdentifier];
        }
        
        poiAnnotationView.animatesDrop              = YES;
        poiAnnotationView.canShowCallout            = YES;
        
        //show detail by right callout accessory view.
        poiAnnotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        poiAnnotationView.rightCalloutAccessoryView.tag = 1;
        
        //call online navi by left accessory.
        poiAnnotationView.leftCalloutAccessoryView.tag = 2;
        
        return poiAnnotationView;
    }
    
    return nil;
}

/**
 *  用户位置更新后，会调用此函数
 *  @param userLocation 新的用户位置
 */

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if (updatingLocation) {
        //NSLog(@"latitude : %f , longitude : %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    }

    MACoordinateRegion region = MACoordinateRegionMakeWithDistance(_mapView.centerCoordinate, 500,500);
    region = [_mapView regionThatFits:region];
    [_mapView setRegion:region animated:YES];
    self.mapView.centerCoordinate = userLocation.location.coordinate;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
