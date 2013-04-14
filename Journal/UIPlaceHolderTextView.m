//
//  UIPlaceHolderTextView.m
//  Journal
//
//  Created by Eason on 12/28/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import "UIPlaceHolderTextView.h"

@implementation UIPlaceHolderTextView
@synthesize placeholder;
@synthesize placeholderColor;
@synthesize placeholderLabel;

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [placeholderLabel release];
    placeholderLabel = nil;
    [placeholderColor release];
    placeholderColor = nil;
    [placeholder release];
    placeholder = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textChanged:(NSNotification *)notification
{
    if ([[self placeholder] length] == 0) {
        return;
    }
    
    if ([[self text] length] == 0) {
        [[self viewWithTag:998] setAlpha:1.0f];
    }else{
        [[self viewWithTag:998] setAlpha:0.0f];
    }
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self textChanged:nil];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if ([[self placeholder] length] > 0) {
        if (placeholderLabel == nil) {
            placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, self.bounds.size.width - 16, 0)];
            placeholderLabel.lineBreakMode = UILineBreakModeWordWrap;
            placeholderLabel.numberOfLines = 0;
            placeholderLabel.backgroundColor = [UIColor clearColor];
            placeholderLabel.textColor = self.placeholderColor;
            placeholderLabel.layer.cornerRadius = 8.0f;
            placeholderLabel.alpha = 0.f;
            placeholderLabel.tag = 998;
            [self addSubview:placeholderLabel];
        }
        
        placeholderLabel.text = self.placeholder;
        [placeholderLabel sizeToFit];
        [self sendSubviewToBack:placeholderLabel];
    }
    
    if ([[self text] length] == 0 && [[self placeholder] length] > 0) {
        [[self viewWithTag:998] setAlpha:1.f];
    }
    
    [super drawRect:rect];
}


@end
