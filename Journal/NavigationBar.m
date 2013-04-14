//
//  NavigationBar.m
//  Journal
//
//  Created by Eason on 12/18/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import "NavigationBar.h"

@implementation UINavigationBar (UINavigationBarCustom)
UIImageView *navBackgroundView;

- (void)setBackgroundImage:(UIImage *)image
{
    if(image == nil){
		[navBackgroundView removeFromSuperview];
	}else{
		navBackgroundView = [[UIImageView alloc] initWithImage:image];
		navBackgroundView.frame = CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height);
		navBackgroundView.autoresizingMask  = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[self addSubview:navBackgroundView];
		[self sendSubviewToBack:navBackgroundView];
		[navBackgroundView release];
	}
}


- (void)insertSubview:(UIView *)view
              atIndex:(NSInteger)index
{
    [super insertSubview:view atIndex:index];
    [self sendSubviewToBack:navBackgroundView];
}

@end
