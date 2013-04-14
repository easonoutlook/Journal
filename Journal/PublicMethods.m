//
//  PublicMethods.m
//  Journal
//
//  Created by Eason on 12/17/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import "PublicMethods.h"

@implementation PublicMethods



static PublicMethods *sharedPublicMethods = nil;

+ (PublicMethods *)sharedPublicMethods
{
    @synchronized(self){
        if (sharedPublicMethods == nil) {
            sharedPublicMethods = [[[PublicMethods alloc] init] autorelease];
        }
    }
    return sharedPublicMethods;
}


+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self){
        if (sharedPublicMethods == nil) {
            sharedPublicMethods = [super allocWithZone:zone];
            return sharedPublicMethods;
        }
    }
    return nil;
}


- (NSString *)getMainBundleResourcePathWithName:(NSString *)rName
{
    NSString *resourePath = [self getMainBundleResourcePathWithName:rName type:@"png"];
    return resourePath;
}


- (NSString *)getMainBundleResourcePathWithName:(NSString *)rName
                                           type:(NSString *)rType
{
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:rName ofType:rType];
    return resourcePath;
}

@end
