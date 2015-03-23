//
//  CreateScheduleViewController.m
//  SimpleReminder
//
//  Created by Newbie on 3/23/15.
//  Copyright (c) 2015 CodeF. All rights reserved.
//

#import "CreateScheduleViewController.h"

@interface CreateScheduleViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtNoiDung;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation CreateScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createASchedule:(id)sender {
    [self.txtNoiDung resignFirstResponder];
    
    // Get the current date
    NSDate *pickerDate = [self.datePicker date];
    
    // Schedule the notification
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = self.txtNoiDung.text;
    localNotification.alertAction = @"Blah blah blah";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    // Dismiss the view controller
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
