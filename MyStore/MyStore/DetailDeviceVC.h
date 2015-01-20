//
//  DetailDeviceVC.h
//  MyStore
//
//  Created by SYS Vietnam_ThuyNguyen on 1/14/15.
//  Copyright (c) 2015 CodeF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailDeviceVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *version;
@property (strong, nonatomic) IBOutlet UITextField *company;

@property (strong) NSManagedObject *device;


- (IBAction)saveBtnTap:(id)sender;
- (IBAction)cancelBtnTap:(id)sender;

@end
