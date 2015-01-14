//
//  ItemDetailController.m
//  SimpleTable
//
//  Created by sysvietnamcoltd03 on 1/14/15.
//  Copyright (c) 2015 CodeF. All rights reserved.
//

#import "ItemDetailController.h"

@interface ItemDetailController ()

@end

@implementation ItemDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itemlbl.text = self.itemName;
    self.pricelbl.text = self.itemPrice;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}
*/

@end
