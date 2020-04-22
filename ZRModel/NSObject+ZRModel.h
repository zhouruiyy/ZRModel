//
//  NSObject+ZRModel.h
//  ZRModel
//
//  Created by Zhou,Rui on 2020/4/21.
//  Copyright © 2020 Zhou,Rui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZRModelDelegate <NSObject>

+ (NSDictionary *)arrayContainModelClass;

@end

@interface NSObject (ZRModel)

+ (instancetype)modelWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
