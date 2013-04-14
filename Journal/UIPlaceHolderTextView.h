//
//  UIPlaceHolderTextView.h
//  Journal
//
//  Created by Eason on 12/28/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIPlaceHolderTextView : UITextView
{
    NSString *placeholder;
    UIColor *placeholderColor;
    UILabel *placeholderLabel;
}

@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;
@property (nonatomic, retain) UILabel *placeholderLabel;

- (void)textChanged:(NSNotification*)notification;

@end
