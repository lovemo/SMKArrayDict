//
//  NSMutableArray+SMKArrayDict.m
//  lovemo
//
//  Created by Mac on 15/10/21.
//  Copyright © 2015年 momo. All rights reserved.
//

#import "NSMutableArray+SMKArrayDict.h"

@implementation NSMutableArray (SMKArrayDict)

+ (NSMutableArray *)smk_arrayWithMemberIsOnly:(NSMutableArray *)array {
    
    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
    
    for (unsigned i = 0; i < [array count]; i++) {
        if ([categoryArray containsObject:[array objectAtIndex:i]] == NO) {
            [categoryArray addObject:[array objectAtIndex:i]];
        }
    }
    return categoryArray;
}

+ (NSMutableArray *)smk_arrayWithSortOfArr:(NSArray *)arrayI isPositiveSort:(BOOL)isPositiveSort {
    
    NSArray *sortedArray = [arrayI sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        //这里的代码可以参照上面compare:默认的排序方法，也可以把自定义的方法写在这里，给对象排序
        NSComparisonResult result = isPositiveSort ? [obj1 compare:obj2] : [obj2 compare:obj1];
        return result;
    }];
    return [NSMutableArray arrayWithArray:sortedArray];
}

+ (NSArray *)smk_arrayWithPickSameDataFromArray:(NSArray *)array {
    
    NSMutableArray *dateMutablearray = [@[] mutableCopy];
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
    for (int i = 0; i < mutableArray.count; i ++) {
        NSString *string = mutableArray[i];
        NSMutableArray *tempArray = [@[] mutableCopy];
        [tempArray addObject:string];
        for (int j = i+1; j < mutableArray.count; j ++) {
            NSString *jstring = mutableArray[j];
            if([string isEqualToString:jstring]){
                [tempArray addObject:jstring];
            }
        }
        if ([tempArray count] > 1) {
            [mutableArray removeObjectsInArray:tempArray];
            i -= 1;    //去除重复数据 新数组开始遍历位置不变
        }
        [dateMutablearray addObject:tempArray];
        
    }
    
    return dateMutablearray;
}

+ (NSMutableArray *)smk_arrayWithSortedOfDict:(NSMutableArray *)arrayM withSpecifiedKey:(NSString *)specifiedKey isAscending:(BOOL)isAscending {
    
    NSArray *sortDesc = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:specifiedKey ascending:isAscending]];
    NSArray *sortedArr = [arrayM sortedArrayUsingDescriptors:sortDesc];
    
    return [NSMutableArray arrayWithArray:sortedArr];
}

+ (NSMutableArray *)smk_arrayWithRemoveDuplicateDictOfArrayM:(NSMutableArray *)arrayM specifiedKey:(NSString *)specifiedKey addValueOfKey:(NSString *)addValueOfKey {
    
    NSMutableArray *jIndexArr = [NSMutableArray array];
    for (unsigned i = 0; i < [arrayM count]; i++) {
        NSString *str = arrayM[i][specifiedKey];
        
        for (unsigned j = i+1; j < arrayM.count; j++) {
            NSString *str2 = arrayM[j][specifiedKey];
            NSInteger countAfter = [arrayM[j][addValueOfKey] integerValue];
            NSInteger countBefore = [arrayM[i][addValueOfKey] integerValue];
            if ([str isEqualToString:str2]) {
                NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:arrayM[i]];
                
                dict[addValueOfKey] = [NSString stringWithFormat:@"%d",(int)(countBefore + countAfter)];
                arrayM[i] = dict;
                NSString *jIndex = [NSString stringWithFormat:@"%zd",j];
                [jIndexArr addObject:jIndex];
                
            }
        }
    }
    
    jIndexArr = [NSMutableArray smk_arrayWithMemberIsOnly:jIndexArr];
    jIndexArr = [NSMutableArray smk_arrayWithSortOfArr:jIndexArr isPositiveSort:NO];
    
    for (NSString *str in jIndexArr) {
        NSInteger index = [str integerValue];
        [arrayM removeObjectAtIndex:index--];
        
    }
    return arrayM;
}

+ (NSMutableArray *)smk_arrayWithSelectedDict:(NSMutableArray *)arrayM withSpecifiedKey:(NSString *)specifiedKey withSpecifiedValue:(NSString *)specifiedValue{
    
    NSMutableArray *selectedArr = [NSMutableArray array];
    
    if (specifiedValue == nil) {
        for (NSDictionary *dict in arrayM) {
            if ([[dict allKeys] containsObject:specifiedKey]) {
                [selectedArr addObject:dict];
            }
        }
        return selectedArr;
    }
    
    for (NSDictionary *dict in arrayM) {
        if ([[dict allKeys] containsObject:specifiedKey]) {
            if ([dict[specifiedKey] isEqualToString:specifiedValue]) {
                [selectedArr addObject:dict];
            }
        }
    }
    return selectedArr;
}

+ (NSMutableArray *)smk_arrayWithRemovedDict:(NSMutableArray *)arrayM withSpecifiedKey:(NSString *)specifiedKey withSpecifiedValue:(NSString *)specifiedValue{
    
    NSMutableArray *removedArr = [NSMutableArray array];
    
    if (specifiedValue == nil) {
        for (NSDictionary *dict in arrayM) {
            if (![[dict allKeys] containsObject:specifiedKey]) {
                [removedArr addObject:dict];
            }
        }
        return removedArr;
    }
    
    for (NSDictionary *dict in arrayM) {
        if ([[dict allKeys] containsObject:specifiedKey]) {
            if (![dict[specifiedKey] isEqualToString:specifiedValue]) {
                [removedArr addObject:dict];
            }
        }
    }
    return removedArr;
}

@end
