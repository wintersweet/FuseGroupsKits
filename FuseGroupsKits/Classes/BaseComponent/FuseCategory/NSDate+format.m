//
//  NSDate+format.m
//  FUSEPRO
//
//  Created by tancheng on 2019/6/27.
//  Copyright © 2019 FUSENANO. All rights reserved.
//

#import "NSDate+format.h"


@implementation NSDate (format)

- (NSString *)toDateStringWithFormatterString:(NSString *)formatterString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = formatterString;
    
    NSString *dateString = [formatter stringFromDate:self];
    
    return dateString;
}


@end
