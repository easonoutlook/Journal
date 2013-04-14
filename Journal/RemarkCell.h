//
//  RemarkCell.h
//  Journal
//
//  Created by Eason on 12/28/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPlaceHolderTextView.h"

@interface RemarkCell : UITableViewCell
{
    UIPlaceHolderTextView *placeholderTextView;
}

@property (nonatomic, retain) UIPlaceHolderTextView *placeholderTextView;

@end
