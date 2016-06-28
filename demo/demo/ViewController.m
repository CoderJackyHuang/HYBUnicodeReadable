//
//  ViewController.m
//  demo
//
//  Created by huangyibiao on 15/12/29.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  NSString *str = @"我是转换成data格式的字符串";
  NSData *dataString = [NSData dataWithBytes:str.UTF8String length:str.length];
  NSDictionary *dataSet = @{@"key": @"字典转成data",
                            @"key1": @"在set、数组、字典中嵌套"};
  NSData *dataSetItem = [NSJSONSerialization dataWithJSONObject:dataSet
                                                        options:NSJSONWritingPrettyPrinted
                                                          error:nil];
  
  NSMutableSet *set = [NSMutableSet setWithArray:@[@"可变集合",
                                                   @"字典->不可变集合->可变集合",
                                                   dataSetItem]];
  NSDictionary *dict = @{@"name"  : @"标哥的技术博客",
                         @"title" : @"http://www.henishuo.com",
                         @"count" : @(11),
                         @"dataString" : dataString,
                         @"results" : [NSSet setWithObjects:@"集合值1", @"集合值2", set , nil],
                         @"summaries" : @[@"sm1",
                                          @"sm2",
                                          @{@"keysm": @{@"stkey": @"字典->数组->字典->字典"}},
                                          dataSetItem],
                         @"parameters" : @{@"key1" : @"value1",
                                           @"key2": @{@"key11" : @"value11",
                                                      @"key12" : @[@"三层", @"字典->字典->数组"]},
                                           @"key13": dataSetItem},
                         @"hasBug": @[@"YES",@"NO"],
                         @"contact" : @[@"关注博客地址：http://www.henishuo.com",
                                        @"QQ群: 324400294",
                                        @"关注微博：标哥Jacky",
                                        @"关注GITHUB：CoderJackyHuang"],
                         @"xx" : [NSURLSession sharedSession]};
  NSLog(@"%@", dict);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
