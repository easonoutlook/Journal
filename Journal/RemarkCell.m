//
//  RemarkCell.m
//  Journal
//
//  Created by Eason on 12/28/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import "RemarkCell.h"

@implementation RemarkCell
@synthesize placeholderTextView;

- (void)dealloc{
    [placeholderTextView release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        placeholderTextView = [[UIPlaceHolderTextView alloc] initWithFrame:frame];
        [self addSubview:placeholderTextView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
