//
//  NSDictionary+HYBUnicodeReadable.m
//  demo
//
//  Created by huangyibiao on 15/12/29.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "NSDictionary+HYBUnicodeReadable.h"

@implementation NSDictionary (HYBUnicodeReadable)

#if DEBUG
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
  NSMutableString *desc = [NSMutableString string];
  
  NSMutableString *tabString = [[NSMutableString alloc] initWithCapacity:level];
  for (NSUInteger i = 0; i < level; ++i) {
    [tabString appendString:@"\t"];
  }
  
  NSString *tab = @"";
  if (level > 0) {
    tab = tabString;
  }
  
  [desc appendString:@"\t{\n"];
  
  // 遍历数组,self就是当前的数组
  for (id key in self.allKeys) {
    id obj = [self objectForKey:key];
    
    if (![obj respondsToSelector:@selector(description)]) {
      continue;
    }
    
    if ([obj isKindOfClass:[NSString class]]) {
      [desc appendFormat:@"%@\t%@ = \"%@\",\n", tab, key, obj];
    } else if ([obj isKindOfClass:[NSArray class]]
               || [obj isKindOfClass:[NSDictionary class]]
               || [obj isKindOfClass:[NSSet class]]) {
      [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, [obj descriptionWithLocale:locale indent:level + 1]];
    } else if ([obj isKindOfClass:[NSData class]]) {
      // 如果是NSData类型，尝试去解析结果，以打印出可阅读的数据
      NSError *error = nil;
      NSObject *result =  [NSJSONSerialization JSONObjectWithData:obj
                                                          options:NSJSONReadingMutableContainers
                                                            error:&error];
      // 解析成功
      if (error == nil && result != nil) {
        if ([result isKindOfClass:[NSDictionary class]]
            || [result isKindOfClass:[NSArray class]]
            || [result isKindOfClass:[NSSet class]]) {
          NSString *str = [((NSDictionary *)result) descriptionWithLocale:locale indent:level + 1];
          [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, str];
        } else if ([obj isKindOfClass:[NSString class]]) {
          [desc appendFormat:@"%@\t%@ = \"%@\",\n", tab, key, result];
        }
      } else {
        @try {
          NSString *str = [[NSString alloc] initWithData:obj encoding:NSUTF8StringEncoding];
          if (str != nil) {
            [desc appendFormat:@"%@\t%@ = \"%@\",\n", tab, key, str];
          } else {
            [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, obj];
          }
        }
        @catch (NSException *exception) {
          [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, obj];
        }
      }
    } else {
      @try {
        [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, obj];
      } @catch (NSException *exception) {
        
      } @finally {
        
      }
    }
  }
  
  [desc appendFormat:@"%@}", tab];
  
  return desc;
}
#endif

@end
