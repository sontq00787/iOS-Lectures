//
//  ViewController.h
//  MyStore
//
//  Created by SYS Vietnam_ThuyNguyen on 1/14/15.
//  Copyright (c) 2015 CodeF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *titleLb;
@property (strong, nonatomic) IBOutlet UILabel *company;

@property (strong) NSMutableArray *devices;

@end

