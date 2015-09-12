//
//  JsonHelper.m
//  ProjectRoyalBlue
//
//  Created by RaulStudio on 15/9/7.
//  Copyright © 2015年 RaulStudio. All rights reserved.
//

#import "JsonHelper.h"

@implementation JsonHelper


+ (NSString *)readeJsonFile:(NSString *)file
{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];//
}
+ (id)jsonToObject
{
    NSString * jsonStr = [self readeJsonFile:@"gradients"];
    NSLog(@"%@",jsonStr);
    NSData * data =[jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError * error;
    NSDictionary * jsonDic = [ NSJSONSerialization  JSONObjectWithData:data options:kNilOptions error:&error];
    
    return nil;
}

//NSString *path = [[NSBundle mainBundle] pathForResource:@"webclip" ofType:@"html"];
//NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

@end
