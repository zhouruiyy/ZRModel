//
//  ViewController.m
//  ZRModel
//
//  Created by Zhou,Rui on 2020/4/21.
//  Copyright © 2020 Zhou,Rui. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+ZRModel.h"
#import "Test.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *dict = @{
        @"name" : @"Jack",
        @"icon" : @"lufy.png",
        @"age" : @20,
        @"height" : @"1.55",
        @"money" : @100.9,
        @"sex" : @(SexFemale),
        @"gay" : @"true"
    //   @"gay" : @"1"
    //   @"gay" : @"NO"
    };
    User *user = [User modelWithDic:dict];
    NSLog(@"user : %@", user);
    
    NSString *jsonString = @"{\"name\":\"Jack\", \"icon\":\"lufy.png\", \"age\":20}";
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
    User *user1 = [User modelWithDic:dic];
    NSLog(@"user1 : %@", user1);
    
    NSDictionary *dict2 = @{
        @"text" : @"Agree!Nice weather!",
        @"user" : @{
            @"name" : @"Jack",
            @"icon" : @"lufy.png"
        },
        @"retweetedStatus" : @{
            @"text" : @"Nice weather!",
            @"user" : @{
                @"name" : @"Rose",
                @"icon" : @"nami.png"
            }
        }
    };
    Status *status = [Status modelWithDic:dict2];
    NSLog(@"status %@", status);
    
    NSDictionary *dict3 = @{
        @"statuses" : @[
                          @{
                              @"text" : @"Nice weather!",
                              @"user" : @{
                                  @"name" : @"Rose",
                                  @"icon" : @"nami.png"
                              }
                          },
                          @{
                              @"text" : @"Go camping tomorrow!",
                              @"user" : @{
                                  @"name" : @"Jack",
                                  @"icon" : @"lufy.png"
                              }
                          }
                      ],
        @"ads" : @[
                     @{
                         @"image" : @"ad01.png",
                         @"url" : @"http://www.ad01.com"
                     },
                     @{
                         @"image" : @"ad02.png",
                         @"url" : @"http://www.ad02.com"
                     }
                 ],
        @"totalNumber" : @"2014"
    };
    
    StatusResult *result = [StatusResult modelWithDic:dict3];
    NSLog(@"statusresult %@", result);
}


@end
