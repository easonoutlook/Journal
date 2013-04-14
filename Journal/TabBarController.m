//
//  TabBarController.m
//  Journal
//
//  Created by Eason on 12/17/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import "TabBarController.h"
#import "Defaults.h"

@interface TabBarController ()

@end

@implementation TabBarController

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
    [self initTabBarControllers];
    self.selectedIndex = 0;
    
    [self setTabBarBackgroundImage];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    [self setNoHighlightTabBar];
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController
{
    [super setSelectedViewController:selectedViewController];
    [self setNoHighlightTabBar];
}

/*
 *@以tabBar为基础的应用中,需要初始化对应的viewControllers
 *
 *@具体的功能通过调用这个方法来完成
 */
- (void)initTabBarControllers
{
    AddViewController *addViewController = [[[AddViewController alloc] init] autorelease];
    NavBarController *addNav = [[[NavBarController alloc] initWithRootViewController:addViewController] autorelease];
    addNav.tabBarItem.title = @"记帐";
    addNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_add"];
    
    AnalysisViewController *analysisViewController = [[[AnalysisViewController alloc] init] autorelease];
    NavBarController *analysisNav = [[[NavBarController alloc] initWithRootViewController:analysisViewController] autorelease];
    analysisNav.tabBarItem.title = @"分析";
    analysisNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_search"];
    
    AccountViewController *accountViewController = [[[AccountViewController alloc] init] autorelease];
    NavBarController *accountNav = [[[NavBarController alloc] initWithRootViewController:accountViewController] autorelease];
    accountNav.tabBarItem.title = @"账户";
    accountNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_mine"];
    
    OtherViewController *otherViewController = [[[OtherViewController alloc] init] autorelease];
    NavBarController *otherNav = [[[NavBarController alloc] initWithRootViewController:otherViewController] autorelease];
    otherNav.tabBarItem.title = @"理财";
    otherNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_arrange"];
    
    SettingViewController *settingViewController = [[[SettingViewController alloc] init] autorelease];
    NavBarController *settingNav = [[[NavBarController alloc] initWithRootViewController:settingViewController] autorelease];
    settingNav.tabBarItem.title = @"设置";
    settingNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_more"];
    
    self.viewControllers = [NSArray arrayWithObjects:addNav, analysisNav, accountNav, otherNav, settingNav, nil];
}

#pragma mark - CustomTabBars
/*
 *@对tabBar重写的时候,需要去掉原有高亮的图片
 *
 *@将tabBar中原有的选中tabBarItem的高亮图片去掉
 *
 *@之前是将highlightView移除,不显示.现在是加上一个高亮的选中图片addSubview
 */
- (void)setNoHighlightTabBar
{
    int tabCount = [self.viewControllers count] > 5 ? 5 : [self.viewControllers count];
    NSArray * tabBarSubviews = [self.tabBar subviews];
    for(int i = [tabBarSubviews count] - 1; i > [tabBarSubviews count] - tabCount - 1; i--)
    {
        for(UIView *view in [[tabBarSubviews objectAtIndex:i] subviews])
        {
            if(view && [NSStringFromClass([view class]) isEqualToString:@"UITabBarSelectionIndicatorView"])
            {//the v is the highlight view.
//                [view removeFromSuperview];
                [view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_selected"]]];
                break;
            }
        }
    }
}


/*
 *@tabBar的背景图片在iOS5+之后有自带的sdk支持,在之前的系统中需要自己写
 *
 *@设置tabBar的background的Image
 */
- (void)setTabBarBackgroundImage
{
    //版本大于5.0则使用原生的api来支持,否则自绘视图来实现
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"tabbar_background@2x" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0")) {
        [self.tabBar setBackgroundImage:[image stretchableImageWithLeftCapWidth:0 topCapHeight:0]];
    }else{
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[image stretchableImageWithLeftCapWidth:0 topCapHeight:0]];
        imageView.frame = CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabBar.frame.size.height + 3);
        imageView.contentMode = UIViewContentModeScaleToFill;
        [self.tabBar insertSubview:imageView atIndex:0];
        [imageView release];
    }
}

#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}


- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
