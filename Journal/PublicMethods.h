//
//  PublicMethods.h
//  Journal
//
//  Created by Eason on 12/17/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicMethods : NSObject

+ (PublicMethods *)sharedPublicMethods;

- (NSString *)getMainBundleResourcePathWithName:(NSString *)rName
                                           type:(NSString *)rType;

- (NSString *)getMainBundleResourcePathWithName:(NSString *)rName;

@end
