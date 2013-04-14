//
//  AddViewController.m
//  Journal
//
//  Created by Eason on 12/17/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import "AddViewController.h"

#define SegmentWidth  150.0f

@interface AddViewController ()

@end

@implementation AddViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = @"";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIBarButtonItem *addRecordButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonClicked:)];
    addRecordButton.tintColor = [UIColor colorWithRed:0.7 green:0.f blue:0.f alpha:1.0f];
    [self.navigationItem setRightBarButtonItem:addRecordButton];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake((ScreenWidth - SegmentWidth) / 2.0f, 7, SegmentWidth, 30)];
    [segment insertSegmentWithTitle:@"全部" atIndex:0 animated:NO];
    [segment insertSegmentWithTitle:@"收入" atIndex:1 animated:NO];
    [segment insertSegmentWithTitle:@"支出" atIndex:2 animated:NO];
    [segment addTarget:self action:@selector(segmentControlClicked:) forControlEvents:UIControlEventValueChanged];
    segment.tintColor = GlobalTintColor;
    segment.selectedSegmentIndex = 0;
    [segment setSegmentedControlStyle:UISegmentedControlStyleBar];
    [self.navigationController.navigationBar addSubview:segment];
    [segment release];
    
    UITableView *recordTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - 20, ScreenWidth, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - self.tabBarController.tabBar.frame.size.height) style:UITableViewStylePlain];
    recordTableView.dataSource = self;
    recordTableView.delegate = self;
    [self.view addSubview:recordTableView];
    [recordTableView release];
}

- (void)addButtonClicked:(id)sender
{
    NSLog(@"Add a new record.");
    AddRecordViewController *addRecordViewController = [[[AddRecordViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
    NavBarController *addRecordNav = [[[NavBarController alloc] initWithRootViewController:addRecordViewController] autorelease];
    [self presentModalViewController:addRecordNav animated:YES];
}

- (void)segmentControlClicked:(id)sender
{
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    NSLog(@"segment clicked %d", seg.selectedSegmentIndex);
}

#pragma mark - UITableViewDataSource
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer] autorelease];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %d %d", indexPath.section, indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
