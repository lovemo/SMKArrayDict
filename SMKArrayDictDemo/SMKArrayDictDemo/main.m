//
//  main.m
//  SMKArrayDictDemo
//
//  Created by Mac on 16/9/11.
//  Copyright © 2016年 lovemo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+SMKArrayDict.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *Array = @[
                           @{
                               @"CART_ID" : @"1351",
                               @"COUNT" : @"2",
                               @"ID" : @"300036"
                               },
                           @{
                               @"CART_ID" : @"1352",
                               @"COUNT" : @"2",
                               @"ID" : @"300037"
                               },
                           @{
                               @"CART_ID" : @"1352",
                               @"COUNT" : @"2",
                               @"ID" : @"300038"
                               },
                           @{
                               @"CART_ID" : @"1352",
                               @"COUNT" : @"2",
                               @"ID" : @"300037"
                               },
                           @{
                               @"CART_ID" : @"1352",
                               @"COUNT" : @"2",
                               @"ID" : @"300037"
                               },
                           @{
                               @"CART_ID" : @"1355",
                               @"COUNT" : @"1",
                               @"ID" : @"300037",
                               @"SS" : @"fffff"
                               }
                           ];
        
        NSMutableArray *arr = [NSMutableArray arrayWithArray:Array];
        arr = [NSMutableArray smk_arrayWithRemoveDuplicateDictOfArrayM:arr specifiedKey:@"CART_ID" addValueOfKey:@"COUNT"];
        NSLog(@"%@",arr);
        
    }
    return 0;
}
