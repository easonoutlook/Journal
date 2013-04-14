//
//  Database.h
//  Journal
//
//  Created by Eason on 12/21/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defaults.h"

@interface Database : NSObject


+ (Database *)sharedDatabase;

- (NSString *)dbFilePath;

- (void)createTable;

- (void)insertRecord:(NSDictionary *)record;

@end
