# HYBUnicodeReadable
解决打印日志对于Unicode编码不能正常显示中文的问题，只需要将文件导入工程，不需要引用，就能达到打印日志显示Unicode编码中文数据

#用途

在开发中，通常希望在console中打印出的信息能够显示出Unicode编码对应的中文，由此作者研究了一下如何解决此问题。
在这里，将此解决方案贡献给大家，如果觉得有用，请给个star!

#安装使用

支持cocoapods：

```
pod 'HYBUnicodeReadable', '~> 1.1'
```

或者直接下载源代码然后拖入工程即可！！！

>注意：不需要引入头文件一样可以使用的！！！

#效果图

![image](https://github.com/CoderJackyHuang/HYBUnicodeReadable/blob/master/screenshot.gif)

#version 1.0

增加对NSData类型的数据的可视化打印，如下：

```
NSString *str = @"我是转换成data格式的字符串";
  NSData *dataString = [NSData dataWithBytes:str.UTF8String length:str.length];
  NSDictionary *dataSet = @{@"key": @"字典转成data",
                            @"key1": @"在set、数组、字典中嵌套"};
  NSData *dataSetItem = [NSJSONSerialization dataWithJSONObject:dataSet options:NSJSONWritingPrettyPrinted error:nil];
  
  NSMutableSet *set = [NSMutableSet setWithArray:@[@"可变集合", @"字典->不可变集合->可变集合", dataSetItem]];
  NSDictionary *dict = @{@"name"  : @"标哥的技术博客",
                         @"title" : @"http://www.henishuo.com",
                         @"count" : @(11),
                         @"dataString" : dataString,
                         @"results" : [NSSet setWithObjects:@"集合值1", @"集合值2", set , nil],
                         @"summaries" : @[@"sm1", @"sm2", @{@"keysm": @{@"stkey": @"字典->数组->字典->字典"}}, dataSetItem],
                         @"parameters" : @{@"key1" : @"value1", @"key2": @{@"key11" : @"value11", @"key12" : @[@"三层", @"字典->字典->数组"]}, @"key13": dataSetItem},
                         @"hasBug": @[@"YES",@"NO"],
                         @"contact" : @[@"关注博客地址：http://www.henishuo.com", @"QQ群: 324400294", @"关注微博：标哥Jacky", @"关注GITHUB：CoderJackyHuang"]};
  NSLog(@"%@", dict);
```

打印结果为：

```
2015-12-31 16:47:42.352 demo[58176:2693559] 	{
	hasBug = 	(
		"YES",
		"NO",
	),
	dataString = "我是转换成",
	title = "http://www.henishuo.com",
	count = 11,
	results = 	{(
		"集合值2",
		"集合值1",
			{(
			"可变集合",
			"字典->不可变集合->可变集合",
				{
				key = "字典转成data",
				key1 = "在set、数组、字典中嵌套",
			},
		)},
	)},
	summaries = 	(
		"sm1",
		"sm2",
			{
			keysm = 	{
				stkey = "字典->数组->字典->字典",
			},
		},
			{
			key = "字典转成data",
			key1 = "在set、数组、字典中嵌套",
		},
	),
	contact = 	(
		"关注博客地址：http://www.henishuo.com",
		"QQ群: 324400294",
		"关注微博：标哥Jacky",
		"关注GITHUB：CoderJackyHuang",
	),
	name = "标哥的技术博客",
	parameters = 	{
		key1 = "value1",
		key13 = 	{
			key = "字典转成data",
			key1 = "在set、数组、字典中嵌套",
		},
		key2 = 	{
			key11 = "value11",
			key12 = 	(
				"三层",
				"字典->字典->数组",
			),
		},
	},
}
```

#Version1.1

增加条件编译，只对Debug环境下起作用

#讲解

为了更详细地说明如何使用，笔者写了一篇博文，大家可以阅读：[http://www.henishuo.com/ios-unicode-readable/](http://www.henishuo.com/ios-unicode-readable/)

#维护

笔者会一直维护，如果使用过程中出现任何bug，请反馈给作者，谢谢您的支持！！！

#关注我

如果在使用过程中遇到问题，或者想要与我交流，可加入有问必答**QQ群：[324400294]()**

关注微信公众号：[**iOSDevShares**]()

关注新浪微博账号：[标哥Jacky](http://weibo.com/u/5384637337)

#支持并捐助

如果您觉得文章对您很有帮助，希望得到您的支持。您的捐肋将会给予我最大的鼓励，感谢您的支持！

支付宝捐助      | 微信捐助
------------- | -------------
![image](http://www.henishuo.com/wp-content/uploads/2015/12/alipay-e1451124478416.jpg) | ![image](http://www.henishuo.com/wp-content/uploads/2015/12/weixin.jpg)
