//
//  HYBTestModel.h
//  demo
//
//  Created by huangyibiao on 16/2/3.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYBTestModel : NSObject

@property (nonatomic, assign) int namesCount;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *models;
@property (nonatomic, assign) char *name1;

@end

@interface HYBModel : NSObject

@property (nonatomic, copy) NSString *modelName;
@property (nonatomic, strong) NSDictionary *dict;

@end
