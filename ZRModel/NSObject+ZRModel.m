//
//  NSObject+ZRModel.m
//  ZRModel
//
//  Created by Zhou,Rui on 2020/4/21.
//  Copyright © 2020 Zhou,Rui. All rights reserved.
//

#import "NSObject+ZRModel.h"
#import <objc/runtime.h>

@implementation NSObject (ZRModel)

+ (instancetype)modelWithDic:(NSDictionary *)dic {
    id instance = [[self alloc] init];
    
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *key = [ivarName substringFromIndex:1];
        
        id value = dic[key];
        if (value == nil) {
            continue;
        }
        
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        NSLog(@"ivar - %@, type - %@", ivarName, ivarType);
        
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            Class modelClass = NSClassFromString(ivarType);
            value = [modelClass modelWithDic:value];
        } else if ([value isKindOfClass:[NSArray class]]) {
            if ([self respondsToSelector:@selector(arrayContainModelClass)]) {
                id idSelf = self;
                NSString *type = [idSelf arrayContainModelClass][key];
                Class classModel = NSClassFromString(type);
                NSMutableArray *arr = [NSMutableArray array];
                for (NSDictionary *dic in value) {
                    id model = [classModel modelWithDic:dic];
                    if (model) {
                        [arr addObject:model];
                    }
                }
                
                value = arr;
            }
        }
        if (value) {
            [instance setValue:value forKey:key];
        }
    }
    
    return instance;
}

@end
