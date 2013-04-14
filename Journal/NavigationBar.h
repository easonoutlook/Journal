//
//  NavigationBar.h
//  Journal
//
//  Created by Eason on 12/18/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UINavigationBar (UINavigationBarCustom)


- (void)setBackgroundImage:(UIImage*)image;

- (void)insertSubview:(UIView *)view
              atIndex:(NSInteger)index;

@end