//
//  NSDictionary+HYBUnicodeReadable.m
//  demo
//
//  Created by huangyibiao on 15/12/29.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "NSDictionary+HYBUnicodeReadable.h"

@implementation NSDictionary (HYBUnicodeReadable)

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
    
    if ([obj isKindOfClass:[NSString class]]) {
      [desc appendFormat:@"%@\t%@ = \"%@\",\n", tab, key, obj];
    } else if ([obj isKindOfClass:[NSArray class]]
               || [obj isKindOfClass:[NSDictionary class]]
               || [obj isKindOfClass:[NSSet class]]) {
      [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, [obj descriptionWithLocale:locale indent:level + 1]];
    } else {
      [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, obj];
    }
  }
  
  [desc appendFormat:@"%@}", tab];
  
  return desc;
}

@end
