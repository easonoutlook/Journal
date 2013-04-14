//
//  AnalysisViewController.m
//  Journal
//
//  Created by Eason on 12/17/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import "AnalysisViewController.h"

#define SegmentWidth  150.0f

@interface AnalysisViewController ()

@end

@implementation AnalysisViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake((ScreenWidth - SegmentWidth) / 2.0f, 7, SegmentWidth, 30)];
    [segment insertSegmentWithTitle:@"收入" atIndex:0 animated:NO];
    [segment insertSegmentWithTitle:@"支出" atIndex:1 animated:NO];
    [segment addTarget:self action:@selector(segmentControlClicked:) forControlEvents:UIControlEventValueChanged];
    segment.tintColor = GlobalTintColor;
    segment.selectedSegmentIndex = 0;
    [segment setSegmentedControlStyle:UISegmentedControlStyleBar];
    [self.navigationController.navigationBar addSubview:segment];
    [segment release];
}

- (void)segmentControlClicked:(id)sender
{
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    NSLog(@"segment clicked %d", seg.selectedSegmentIndex);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
