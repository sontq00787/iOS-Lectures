//
//  ViewController.m
//  HelloWorld
//
//  Created by SonTQ on 1/9/15.
//  Copyright (c) 2015 CodeF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Tin nhắn" message:@"Hello World!!!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}
@end
