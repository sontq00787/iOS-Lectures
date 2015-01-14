//
//  ViewController.m
//  SimpleTable
//
//  Created by SonTQ on 1/12/15.
//  Copyright (c) 2015 CodeF. All rights reserved.
//

#import "ViewController.h"
#import "ItemDetailController.h"
@interface ViewController ()

@end

@implementation ViewController{
    NSArray *tableData;
    NSArray *mobilePrices;
    NSArray *mobileImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initialize table data
    tableData = [NSArray arrayWithObjects:@"iPhone 6 Plus", @"Samsung Galaxy S4", @"Sony Xperia Z", @"iPad Air", @"Macbook air 2013", nil];
    mobilePrices = [NSArray arrayWithObjects:@"$299",@"$350",@"$350",@"$499",@"$899",nil];
    mobileImages = [NSArray arrayWithObjects:@"ip6plus.jpg",@"s4.png",@"xperiaz.png",@"ipadAir2.jpg",@"macbookair.jpg", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableCellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableCellIdentifier];
    }
    //hiển thị images
    UIImageView *image = (UIImageView *)[cell.contentView viewWithTag:10];
    image.image = [UIImage imageNamed:[mobileImages objectAtIndex:indexPath.row]];
//    cell.imageView.image = [UIImage imageNamed:[mobileImages objectAtIndex:indexPath.row]];
    
    //hiển thị tên items
    UILabel *labelItem = (UILabel *)[cell.contentView viewWithTag:11];
    labelItem.text = [tableData objectAtIndex:indexPath.row];
    
    //hiển thị giá của items
    UILabel *labelPrice = (UILabel*)[cell.contentView viewWithTag:12];
    labelPrice.text = [mobilePrices objectAtIndex:indexPath.row];
    
    return cell;
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self performSegueWithIdentifier:@"showInfo" sender:self];
//}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showInfo"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ItemDetailController *itemDetailVC = segue.destinationViewController;
        itemDetailVC.itemName = [tableData objectAtIndex:indexPath.row];
        itemDetailVC.itemPrice = [mobilePrices objectAtIndex:indexPath.row];
    }
}

@end
