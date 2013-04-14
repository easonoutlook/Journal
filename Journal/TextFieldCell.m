//
//  TextFieldCell.m
//  Journal
//
//  Created by Eason on 1/27/13.
//  Copyright (c) 2013 iTalk. All rights reserved.
//

#import "TextFieldCell.h"

@implementation TextFieldCell
@synthesize uiTextField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        uiTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, 180, 24)];
        uiTextField.textAlignment = UITextAlignmentRight;
        uiTextField.backgroundColor = [UIColor clearColor];
        [self addSubview:uiTextField];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
