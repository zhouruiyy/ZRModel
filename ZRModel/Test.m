//
//  Test.m
//  ZRModel
//
//  Created by Zhou,Rui on 2020/4/22.
//  Copyright © 2020 Zhou,Rui. All rights reserved.
//

#import "Test.h"

@implementation Test

@end

@implementation User

@end

@implementation Status

@end

@implementation Ad

@end

@implementation StatusResult
+ (NSDictionary *)arrayContainModelClass {
    return @{@"statuses": @"Status",
             @"ads": @"Ad",
    };
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"zr undefined key.");
}

@end
