//
//  DetailDeviceVC.m
//  MyStore
//
//  Created by SYS Vietnam_ThuyNguyen on 1/14/15.
//  Copyright (c) 2015 CodeF. All rights reserved.
//

#import "DetailDeviceVC.h"

@interface DetailDeviceVC ()

@end

@implementation DetailDeviceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (IBAction)cancelBtnTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveBtnTap:(id)sender {

    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
    [newDevice setValue:self.name.text forKey:@"name"];
    [newDevice setValue:self.version.text forKey:@"version"];
    [newDevice setValue:self.company.text forKey: @"company"];
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
