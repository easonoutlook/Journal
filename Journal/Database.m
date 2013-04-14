//
//  Database.m
//  Journal
//
//  Created by Eason on 12/21/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import "Database.h"

@implementation Database

static Database *sharedDatabase = nil;

+ (Database *)sharedDatabase
{
    @synchronized(self){
        if (sharedDatabase == nil) {
            sharedDatabase = [[[Database alloc] init] autorelease];
        }
    }
    return sharedDatabase;
}


+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self){
        if (sharedDatabase == nil) {
            sharedDatabase = [super allocWithZone:zone];
            return sharedDatabase;
        }
    }
    return nil;
}


- (NSString *)dbFilePath
{
    //参考许多app的内部结构,sqlite做的存储数据大多都放置在Documents里面
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"journal.sqlite"];
    return dbPath;
}


- (void)createTable
{
    NSString *dbPath = [self dbFilePath];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"Could not open db.");
        return;
    }
    NSLog(@"db path is %@", [self dbFilePath]);
    [db executeUpdate:@"create table recordlist (id integer primary key autoincrement, amount double, date text, type integer, consume integer, remark text)"];
}


- (void)insertRecord:(NSDictionary *)record
{
    NSString *dbPath = [self dbFilePath];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"Could not open db.");
    }
    [db executeUpdate:@"insert into recordlist (amount, date, type, consume, remark) values(?,?,?,?,?,?)", [NSNumber numberWithDouble:17.3f], [NSDate date]];
}


//http://blog.csdn.net/think12/article/details/7217971
//http://blog.sina.com.cn/s/blog_6d01cce3010199if.html
//https://github.com/easonoutlook/NSLogger


- (NSDate *)localDate
{
    NSDate *date = [NSDate date];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    NSDate *localDate = [date dateByAddingTimeInterval:interval];
    NSLog(@"local date is %@", localDate);
    return localDate;
}


@end
