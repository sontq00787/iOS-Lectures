//
//  ItemDetailController.h
//  SimpleTable
//
//  Created by sysvietnamcoltd03 on 1/14/15.
//  Copyright (c) 2015 CodeF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDetailController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *itemlbl;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) IBOutlet UILabel *pricelbl;
@property (nonatomic, strong) NSString *itemPrice;

@end
