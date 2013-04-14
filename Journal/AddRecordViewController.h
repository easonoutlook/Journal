//
//  AddRecordViewController.h
//  Journal
//
//  Created by Eason on 12/19/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Defaults.h"

@interface AddRecordViewController : UITableViewController<VRGCalendarViewDelegate>
{
    NSArray *itemTitles;
    UITextView *textView;
}

@end
