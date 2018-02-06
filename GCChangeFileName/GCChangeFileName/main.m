//
//  main.m
//  GCChangeFileName
//
//  Created by 高崇 on 2018/2/6.
//  Copyright © 2018年 高崇. All rights reserved.
//

#import <Foundation/Foundation.h>


void changeWithPrefix(NSString *prefixString)
{
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSArray *pathArr = @[
                         @"/Users/gaochong/Desktop/ceshi/xh",
                         @"/Users/gaochong/Desktop/ceshi/xxh"
                         ];
    NSArray *SuffixArr = @[
                           @"@2x.",
                           @"@3x."
                           ];
    NSString *tempStr = @"/Users/gaochong/Desktop/ceshi/天气";
    
    for (int i = 0; i< pathArr.count; i++) {
        
        NSString *filePath = pathArr[i];
        
        NSArray *oldArr = [fm contentsOfDirectoryAtPath:filePath error:nil];
        
        for (NSString *oldName in oldArr) {
            if ([oldName containsString:@"."] && ![oldName containsString:@"DS_Store"]) {
                
                NSString *old_filepath = [NSString stringWithFormat:@"%@/%@", filePath, oldName];
                
                NSString *newName = [oldName stringByReplacingOccurrencesOfString:@"." withString:[NSString stringWithFormat:@"%@", SuffixArr[i]]];
                newName = [NSString stringWithFormat:@"%@%@", prefixString, newName];
                NSString *new_filePath = [NSString stringWithFormat:@"%@/%@", tempStr, newName];
                
                [fm moveItemAtPath:old_filepath toPath:new_filePath error:nil];
            }
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        changeWithPrefix(@"");
        NSLog(@".....完成!");
    }
    return 0;
}

