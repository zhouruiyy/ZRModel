//
//  Test.h
//  ZRModel
//
//  Created by Zhou,Rui on 2020/4/22.
//  Copyright © 2020 Zhou,Rui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+ZRModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    SexMale,
    SexFemale
} Sex;

@interface Test : NSObject

@end

@interface User : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *icon;
@property (copy, nonatomic) NSString *height;
@property (strong, nonatomic) NSNumber *money;
@property (assign, nonatomic) Sex sex;
@property (assign, nonatomic, getter=isGay) BOOL gay;
@end

@interface Status : NSObject
@property (copy, nonatomic) NSString *text;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) Status *retweetedStatus;
@end

@interface Ad : NSObject
@property (copy, nonatomic) NSString *image;
@property (copy, nonatomic) NSString *url;
@end

@interface StatusResult : NSObject <ZRModelDelegate>
@property (strong, nonatomic) NSMutableArray *statuses;
@property (strong, nonatomic) NSArray *ads;
@property (strong, nonatomic) NSNumber *totalNumber;
@end

NS_ASSUME_NONNULL_END
