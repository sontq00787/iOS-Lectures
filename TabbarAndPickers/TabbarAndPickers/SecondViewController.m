//
//  SecondViewController.m
//  TabbarAndPickers
//
//  Created by SonTQ on 2/10/15.
//  Copyright (c) 2015 CodeF. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation SecondViewController{
    NSArray *pickerData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pickerData = [NSArray arrayWithObjects:@"Chó", @"Mèo", @"Lợn", @"Chuột", @"Gà", @"Ngỗng", @"Chim",nil];
    //connect data
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker Delegate
// The number of columns of data
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *selectedItem = [pickerData objectAtIndex:row];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Đã chọn" message:selectedItem delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alertView show];
}

@end
