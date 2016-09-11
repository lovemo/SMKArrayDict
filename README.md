# SMKArrayDict
NSMutableArray+SMKArrayDict

######

```objc
@interface NSMutableArray (SMKArrayDict)

/**
 *  移除数组中重复元素
 *
 *  @param array 待变数组
 *
 *  @return 已变数组
 */
+ (NSMutableArray *)smk_arrayWithMemberIsOnly:(NSMutableArray *)array;

/**
 *  筛选出重复元素分组放入数组中
 *
 *  @param array 含有重复元素的数组
 *
 *  @return 分组数组
 */
+ (NSArray *)smk_arrayWithPickSameDataFromArray:(NSArray *)array;

/**
 *  数组(数组中不包含字典及复杂类型)元素排序
 *
 *  @param arrayI         待变数组
 *  @param isPositiveSort 是否升序
 *
 *  @return 已变数组
 */
+ (NSMutableArray *)smk_arrayWithSortOfArr:(NSArray *)arrayI isPositiveSort:(BOOL)isPositiveSort;

/**
 *  数组(数组中包含字典)元素排序
 *
 *  @param arrayM       待变数组
 *  @param specifiedKey 指定按照数组字典中key排序
 *  @param isAscending  是否升序
 *
 *  @return 已变数组
 */
+ (NSMutableArray *)smk_arrayWithSortedOfDict:(NSMutableArray *)arrayM withSpecifiedKey:(NSString *)specifiedKey isAscending:(BOOL)isAscending;

/**
 *  去除数组字典中包含某一重复元素，进行按照数组内字典某一元素叠加
 *
 *  @param arrayM        待变数组
 *  @param specifiedKey  指定待去除重复字典的key
 *  @param addValueOfKey 指定字典元素需叠加的key
 *
 *  @return 已变数组
 */
+ (NSMutableArray *)smk_arrayWithRemoveDuplicateDictOfArrayM:(NSMutableArray *)arrayM specifiedKey:(NSString *)specifiedKey addValueOfKey:(NSString *)addValueOfKey;

/**
 *  筛选出数组字典中指定的key-value键值对
 *
 *  @param arrayM         待变数组
 *  @param specifiedKey   指定需筛选的key
 *  @param specifiedValue 指定需筛选的value(可为nil)
 *
 *  @return 已变数组
 */
+ (NSMutableArray *)smk_arrayWithSelectedDict:(NSMutableArray *)arrayM withSpecifiedKey:(NSString *)specifiedKey withSpecifiedValue:(NSString *)specifiedValue;

/**
 *  移除数组字典中指定的key-value键值对
 *
 *  @param arrayM         待变数组
 *  @param specifiedKey   指定要删除的key
 *  @param specifiedValue 指定要删除的value(可为nil)
 *
 *  @return 已变数组
 */
+ (NSMutableArray *)smk_arrayWithRemovedDict:(NSMutableArray *)arrayM withSpecifiedKey:(NSString *)specifiedKey withSpecifiedValue:(NSString *)specifiedValue;

@end
```
