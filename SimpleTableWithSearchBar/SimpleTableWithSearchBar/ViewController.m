//
//  ViewController.m
//  SimpleTableWithSearchBar
//
//  Created by SonTQ on 1/19/15.
//  Copyright (c) 2015 CodeF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSMutableArray *tableData;
    NSMutableArray *searchResults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    tableData = [NSMutableArray arrayWithObjects:@"Iphone 6", @"Samsung galaxy S5", @"Macbook Air Mid 2014", @"Apple Iphone 6 Plus", @"Sony Z", @"Google Nexus", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //Trả về số rows tương ứng với kết quả tìm kiếm khi đang tìm kiếm
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return searchResults.count;
    }
    return [tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableCell"];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SimpleTableCell"];
    }
    //Sử dụng kết quả tìm kiếm để hiển thị ra các rows
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    }
    else{
        cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //Xoá row đã chọn khỏi mảng
    [tableData removeObjectAtIndex:indexPath.row];
    // tải lại tablview
    [tableView reloadData];

}

#pragma mark - UISearchDisplayController delegate methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString];
    return YES;
}

#pragma mark - Content Filtering
- (void)filterContentForSearchText:(NSString*)searchText
{
    
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[c] %@",
                                    searchText];
    NSArray *tempArr = [tableData filteredArrayUsingPredicate:resultPredicate];
    searchResults = [NSMutableArray arrayWithArray:tempArr];
    
}

@end
