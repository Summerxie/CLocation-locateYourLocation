//
//  GoCoderViewController.m
//  mapView2
//
//  Created by Summer on 17/4/11.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "GoCoderViewController.h"
#import <CoreLocation/CoreLocation.h> //导入头文件

@interface GoCoderViewController ()
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UILabel *latitude;
@property (weak, nonatomic) IBOutlet UILabel *longtitide;

@end

@implementation GoCoderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//按钮连线
- (IBAction)btnClick:(id)sender {
    
    //创建编码器
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    
    NSString *address = self.address.text;
    
    //调用方法，物理地址转经纬度
    [coder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks.count == 0 || error) {
            return;
        }
        
        self.latitude.text = @(placemarks.lastObject.location.coordinate.latitude).description;
        self.longtitide.text = @(placemarks.lastObject.location.coordinate.longitude).description;
        
    }];
    
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
