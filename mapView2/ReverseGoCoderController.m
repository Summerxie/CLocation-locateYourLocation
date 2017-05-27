//
//  ReverseGoCoderController.m
//  mapView2
//
//  Created by Summer on 17/4/11.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "ReverseGoCoderController.h"
#import <CoreLocation/CoreLocation.h>

@interface ReverseGoCoderController ()
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *longtitudeTextField;
@property (weak, nonatomic) IBOutlet UILabel *cityAddresslabel;

@end

@implementation ReverseGoCoderController

- (void)viewDidLoad {
    [super viewDidLoad];
   

}
- (IBAction)btnClick:(id)sender {
    
    //创建编码器
    CLGeocoder *coder = [CLGeocoder new];
    
    
    //通过经纬度获取位置
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:[self.latitudeTextFiled.text floatValue] longitude:[self.longtitudeTextField.text floatValue]];
    
    //调用方法，经纬度转物理地址
    [coder reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks.count == 0 || error) {
            return;
        }
        
        self.cityAddresslabel.text = placemarks.lastObject.locality;
        
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
