//
//  NavBarController.m
//  Journal
//
//  Created by Eason on 12/17/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import "NavBarController.h"


@implementation NavBarController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setNavBarBackgroundImage];
}

/*
 *@用于设置navbar的背景,iOS5之后的版本可以通过api直接完成
 *
 *@自定制navbar的背景图片
 */
#pragma mark - CustomsNavBar
- (void)setNavBarBackgroundImage
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"navbar_background@2x" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0")) {
        [self.navigationBar setBackgroundImage:[image stretchableImageWithLeftCapWidth:0 topCapHeight:0] forBarMetrics:UIBarMetricsDefault];
    }else{
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[image stretchableImageWithLeftCapWidth:0 topCapHeight:0]];
        imageView.frame = CGRectMake(0, 0, self.navigationBar.frame.size.width, self.navigationBar.frame.size.height);
        imageView.contentMode = UIViewContentModeScaleToFill;
        [self.navigationBar insertSubview:imageView atIndex:0];
        [imageView release];
    }
}

/*
 *
 *
 *
 */


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
