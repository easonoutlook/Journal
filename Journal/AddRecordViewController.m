//
//  AddRecordViewController.m
//  Journal
//
//  Created by Eason on 12/19/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import "AddRecordViewController.h"
#import "TextFieldCell.h"

@interface AddRecordViewController ()

@end

@implementation AddRecordViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [self.tableView setBackgroundColor:[UIColor lightGrayColor]];
        
        
    }
    return self;
}

- (void)dealloc
{
    [itemTitles release];
    [textView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    itemTitles = [[NSArray alloc] initWithObjects:@"时间:", @"类型:", @"金额:", nil];
    
    //left bar button
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelAddRecord:)];
    cancelButton.tintColor = [UIColor colorWithRed:0.8f green:0.f blue:0.f alpha:1.f];
    [self.navigationItem setLeftBarButtonItem:cancelButton];
    [cancelButton release];
    
    //right bar button
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveNewRecord:)];
    saveButton.tintColor = [UIColor colorWithRed:0.9f green:0.f blue:0.f alpha:1.f];
    [self.navigationItem setRightBarButtonItem:saveButton];
    [saveButton release];
}


#pragma mark - ButtonActions
- (void)dismissAddRecordViewController:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)saveNewRecord:(id)sender
{
    NSLog(@"the save command");
    
}

- (void)cancelAddRecord:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - VRGCalendarDelegate
- (void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated
{
    if (month==[[NSDate date] month]) {
        NSArray *dates = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:5], nil];
        [calendarView markDates:dates];
    }
}

- (void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date
{
    NSLog(@"Selected date = %@",date);
    [calendarView removeFromSuperview];
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 0:
        {
            VRGCalendarView *calender = [[VRGCalendarView alloc] init];
            calender.delegate = self;
            [tableView addSubview:calender];
            break;
        }
        case 1:
        {
            
            break;
        }
        case 2:
        {
            
            break;
        }
            
        default:
            break;
    }
    
    
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2){
        return 80.0f;
    }
    return 44.0f;
}


#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            static NSString *cellIdentifer = @"CellIdentifer";
            TextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
            if (cell == nil) {
                cell = [[[TextFieldCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifer] autorelease];
            }
            
            cell.textLabel.text = [itemTitles objectAtIndex:indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.uiTextField.placeholder = @"请输入这条记录的金额";
            cell.uiTextField.keyboardType = UIKeyboardTypeNumberPad;
            
            return cell;
        }else{
            static NSString *cellIdentifer = @"CellIdentifer";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
            if (cell == nil) {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifer] autorelease];
            }
            
            cell.textLabel.text = [itemTitles objectAtIndex:indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if (indexPath.row == 0) {
                cell.detailTextLabel.text = [self yearMothDay];
            }else if (indexPath.row == 1){
                cell.detailTextLabel.text = @"收入";
            }
            
            return cell;
        }
    }else if(indexPath.section == 1){
        static NSString *cellIdentifer = @"CellIdentifer";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifer] autorelease];
        }
        
        cell.textLabel.text = @"详细分类";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = @"默认分类";
        return cell;
    }else if (indexPath.section == 2){
        static NSString *cellIdentifer = @"CellIdentifer";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer] autorelease];
        }
        
        
        return cell;
    }
    return nil;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [itemTitles count];
    }else{
        return 1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return @"说明备注";
    }
    return nil;
}

- (NSString *)yearMothDay
{
    NSDate *date = [NSDate date];
    NSUInteger componentFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentFlags
                                                                   fromDate:date];
    
    return [NSString stringWithFormat:@"%d-%d-%d", [components year], [components month], [components day]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
