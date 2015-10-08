//
//  SYViewController.m
//  SYSearchBar
//
//  Created by Yu Xulu on 10/04/2015.
//  Copyright (c) 2015 Yu Xulu. All rights reserved.
//

#import "SYViewController.h"
#import "SYSearchResultsViewController.h"
#import <SYSearchBar/UIViewController+SYSearchBar.h>
#import <SYSearchBar/SYSearchButton.h>

static NSString *const kTableViewCellReusableIdentifier = @"TableViewCellReusableIdentifier";

@interface SYViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@end

@implementation SYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellReusableIdentifier];
    [self.view addSubview:_tableView];
    
    [self syAddSearchBarInPosition:CGPointMake(10, 50)];
    self.sySearchButton.placeholder = @"搜索";
    self.sySearchResultsViewController = [[SYSearchResultsViewController alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellReusableIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    cell.textLabel.text = [NSString stringWithFormat:@"Row=%ld", indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > 20) {
        self.sySearchButton.expanded = NO;
    } else {
        self.sySearchButton.expanded = YES;
    }
}
@end
