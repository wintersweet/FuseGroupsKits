//
//  FUTools.m
//  FUSE
//
//  Created by Ch666 on 2017/5/3.
//  Copyright © 2017年 CH. All rights reserved.
//

#import "FUTools.h"
#import <CoreText/CoreText.h>

@implementation FUTools

//邮箱地址的正则表达式
+ (BOOL)isValidateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)isValidateKtp:(NSString *)ktp{
    
    NSString *ktpRegex = @"^\\d{6}(([1256][0-9])|([37][0-1])|([04][1-9]))(0[1-9]|1[0-2])\\d{6}$";
    NSPredicate *ktpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ktpRegex];
    return [ktpTest evaluateWithObject:ktp];
}

+ (BOOL)isEmptyString:(NSString *)str{
    
    if (str == nil || str == NULL) {
        return true;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        return true;
    }
    
    if (!str||str.length == 0) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}
// 字典转json字符串方法
+(NSString *)switchStringWithDictionary:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}
+ (NSString *)threeSeparteWithoutCureencyWithDouble:(double)num {
    NSString *cureency = @"";
    if (!num) {
        return @"0";
    }if (num == 0) {
        return @"0";
    }
    NSString *str = [NSString stringWithFormat:@"%.2f",num];
    NSArray *arrTemp = [str componentsSeparatedByString:@"."];
    
    double X ;
    //可新增各种语言以显示不同金额
    if ([cureency isEqualToString:@"IDR"]) {
        X = [arrTemp[0] doubleValue];
    }else{
        X = [arrTemp[0] doubleValue];
    }
    
    int count = 0;
    long long int a = X;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    //NSString *numStr = [NSString stringWithFormat:@"%.0f",num];
    BOOL isSmarllZero = false;
    if (num<0) {
        num = -num;
        isSmarllZero = YES;
    }
    NSString *numStrTemp = [NSString stringWithFormat:@"%.2f",num];
    NSArray *numArr = [numStrTemp componentsSeparatedByString:@"."];
    NSString *numStr = numArr[0];
    NSMutableString *string = [NSMutableString stringWithString:numStr];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"." atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    [newstring insertString:cureency atIndex:0];
    if (isSmarllZero == YES) {
       [newstring insertString:@"-" atIndex:0];
    }
    return newstring;
}

+ (BOOL)compareStartDate:(NSDate *)startDate WithEndDate:(NSDate *)endDate{
    if (startDate == nil || endDate == nil) {
        return NO;
    }
    NSDate *date = [startDate earlierDate:endDate];
    if ([date isEqualToDate:startDate]) {
        return YES;
    }
    return NO;
}

+ (NSString *)threeSeparteWithDoubleNotUsingUnit:(double)num{
    NSString *cureency = @"";
    if (!num) {
        return [NSString stringWithFormat:@"%@ 0",cureency];
    }if (num == 0) {
        return [NSString stringWithFormat:@"%@ 0",cureency];
    }
    NSString *str = [NSString stringWithFormat:@"%.2f",num];
    NSArray *arrTemp = [str componentsSeparatedByString:@"."];
    
    double X ;
    //可新增各种语言以显示不同金额
    if ([cureency isEqualToString:@"IDR"]) {
        X = [arrTemp[0] doubleValue];
    }else{
        X = [arrTemp[0] doubleValue];
    }
    
    int count = 0;
    long long int a = X;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    BOOL isSmarllZero = false;
    if (num<0) {
        num = -num;
        isSmarllZero = YES;
    }
    //NSString *numStr = [NSString stringWithFormat:@"%.0f",num];
    NSString *numStrTemp = [NSString stringWithFormat:@"%.2f",num];
    NSArray *numArr = [numStrTemp componentsSeparatedByString:@"."];
    NSString *numStr = numArr[0];
    NSMutableString *string = [NSMutableString stringWithString:numStr];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"." atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    [newstring insertString:cureency atIndex:0];
    if (isSmarllZero == YES) {
        [newstring insertString:@"-" atIndex:0];
    }
    return newstring;
}

+ (NSString *)threeSeparteWithDouble:(double)num withCurrency:(NSString *)currencys{
    
    NSString *cureency = [NSString stringWithFormat:@"%@ ",currencys];
    if ([FUTools isEmptyString:currencys]) {
        cureency = @"IDR ";
    }
    
    cureency =  [cureency stringByReplacingOccurrencesOfString:@"." withString:@""];
    if (!num) {
        return [NSString stringWithFormat:@"%@ 0",cureency];
    }if (num == 0) {
        return [NSString stringWithFormat:@"%@ 0",cureency];
    }
    NSString *str = [NSString stringWithFormat:@"%.2f",num];
    NSArray *arrTemp = [str componentsSeparatedByString:@"."];
    
    double X ;
    //可新增各种语言以显示不同金额
    if ([cureency isEqualToString:@"IDR"]) {
        X = [arrTemp[0] doubleValue];
    }else{
        X = [arrTemp[0] doubleValue];
    }
    
    int count = 0;
    long long int a = X;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    BOOL isSmarllZero = false;
    if (num<0) {
        num = -num;
        isSmarllZero = YES;
    }
    //NSString *numStr = [NSString stringWithFormat:@"%.0f",num];
    NSString *numStrTemp = [NSString stringWithFormat:@"%.2f",num];
    NSArray *numArr = [numStrTemp componentsSeparatedByString:@"."];
    NSString *numStr = numArr[0];
    NSMutableString *string = [NSMutableString stringWithString:numStr];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"." atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    [newstring insertString:cureency atIndex:0];
    if (isSmarllZero == YES) {
        [newstring insertString:@"-" atIndex:0];
    }
    return newstring;
}

//时间加减法

+ (NSDate *)datejishuangCycle:(int)cycle withDate:(NSDate *)date Unit:(int)units{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;

    int year,month,day;
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    if (units==3) {
        year = 0;
        month = 0;
        if(cycle == 0){
            day = cycle;
        }
        else{
            day = cycle - 1;
        }
        
    }else if (units == 2){
        year = 0;
        day = 0;
        month = cycle;
        
    }else{
        month = 0;
        day = 0;
        year = cycle;
    }
    
    [adcomps setYear:year];
    
    [adcomps setMonth:month];
    
    [adcomps setDay:day];
    if (units == 2 || units == 1) {
        return [NSDate dateWithTimeInterval:-24*60*60 sinceDate:[calendar dateByAddingComponents:adcomps toDate:date options:0]];
    }
    return [calendar dateByAddingComponents:adcomps toDate:date options:0];
}

+ (NSInteger)getAgeWithDate:(NSDate *)ageDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSCalendarIdentifierGregorian:iOS8之前用NSGregorianCalendar
    
    
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:ageDate];
    NSDateComponents *currentComps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    NSInteger year = comps.year;
    NSInteger month = comps.month;
    NSInteger day = comps.day;
    NSInteger currentYear = currentComps.year;
    NSInteger currentMonth = currentComps.month;
    NSInteger currentDay = currentComps.day;
    
    NSInteger age = currentYear - year;
    if (currentMonth<month) {
        age -= 1;
    }else if (currentMonth == month){
        if (currentDay<day) {
          age -= 1;
        }
    }
    return age;
    
    
}

+ (NSInteger)getSixMonthAgeWithDate:(NSDate *)ageDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSCalendarIdentifierGregorian:iOS8之前用NSGregorianCalendar
    
    
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:ageDate];
    NSDateComponents *currentComps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    NSInteger year = comps.year;
    NSInteger month = comps.month;
    NSInteger day = comps.day;
    NSInteger currentYear = currentComps.year;
    NSInteger currentMonth = currentComps.month;
    NSInteger currentDay = currentComps.day;
    
    NSInteger age = currentYear - year;
    if (currentMonth<month) {
        age -= 1;
    }else if (currentMonth == month){
        if (currentDay<day) {
          age -= 1;
        }
    }
    NSInteger ageMonth = currentMonth - month;
    if (ageMonth<0) {
        ageMonth += 12;
        if (day<currentDay) {
            ageMonth ++;
        }
    }else{
        if (currentDay<day) {
            ageMonth --;
        }
    }
    if (ageMonth > 6) {
        age ++;
    }
    return age;
    
    
}

+ (NSInteger)getAgeWithBirthDate:(NSDate *)birthDate endDate:(NSDate *)endDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSCalendarIdentifierGregorian:iOS8之前用NSGregorianCalendar
    
    
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:birthDate];
    NSDateComponents *currentComps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:endDate];
    NSInteger year = comps.year;
    NSInteger month = comps.month;
    NSInteger day = comps.day;
    NSInteger currentYear = currentComps.year;
    NSInteger currentMonth = currentComps.month;
    NSInteger currentDay = currentComps.day;
    
    NSInteger age = currentYear - year;
    if (currentMonth<month) {
        age -= 1;
    }else if (currentMonth == month){
        if (currentDay<day) {
          age -= 1;
        }
    }
    return age;
    
    
}

+ (NSInteger)caculateTimeWithCycle:(int)cycle Unit:(int)units{
    int year,month,day;
    if (units==3) {
        year = 0;
        month = 0;
        day = cycle;
        
    }else if (units == 2){
        year = 0;
        day = 0;
        month = cycle;
        
    }else{
        month = 0;
        day = 0;
        year = cycle;
    }
    return year*365+month*30+day;
}

+ (NSString *)getDocumentPath:(NSString *)filePath{
    
    
    NSString *doucmentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *jsonPath = [doucmentsPath stringByAppendingPathComponent:filePath];
    return jsonPath;
}

+ (BOOL)removeDocumentPath:(NSString *)filePath{
    
    
    NSString *doucmentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *detailPath = [doucmentsPath stringByAppendingPathComponent:filePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:detailPath]){
      return   [[NSFileManager defaultManager] removeItemAtPath:detailPath error:nil];
    }
    return NO;
        
}

+ (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxLength {
    //    _compressSucc = NO;
    //    CGFloat compression = 1.f;
    //    //CGFloat maxCompression = 0.1f;
    //    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    //    while ([imageData length] > maxFileSize * 1024 && compression > 0) {
    //        compression -= 0.02;
    //        imageData = UIImageJPEGRepresentation(image, compression);
    //    }
    //
    //    UIImage *compressedImage = [UIImage imageWithData:imageData];
    //
    //    _compressSucc = YES;
    //    return compressedImage;
    
    //    CGFloat compression = 1;
    //    NSData *data = UIImageJPEGRepresentation(image, compression);
    //    if (data.length < maxFileSize * 1024) return [UIImage imageWithData:data];
    //    CGFloat max = 1;
    //    CGFloat min = 0;
    //    for (int i = 0; i < 6; ++i) {
    //        compression = (max + min) / 2;
    //        data = UIImageJPEGRepresentation(image, compression);
    //        if (data.length < maxFileSize * 0.9 * 1024) {
    //            min = compression;
    //        } else if (data.length > maxFileSize * 1024) {
    //            max = compression;
    //        } else {
    //            break;
    //        }
    //    }
    //    return [UIImage imageWithData:data];
    
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    //NSLog(@"Before compressing quality, image size = %ld KB",data.length/1024);
    if (data.length < maxLength) return [UIImage imageWithData:data];
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        //NSLog(@"Compression = %.1f", compression);
        //NSLog(@"In compressing quality loop, image size = %ld KB", data.length / 1024);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    //NSLog(@"After compressing quality, image size = %ld KB", data.length / 1024);
    if (data.length < maxLength) return [UIImage imageWithData:data];
    UIImage *resultImage = [UIImage imageWithData:data];
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        //NSLog(@"Ratio = %.1f", ratio);
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
        //NSLog(@"In compressing size loop, image size = %ld KB", data.length / 1024);
    }
    //NSLog(@"After compressing size loop, image size = %ld KB", data.length / 1024);
    return [UIImage imageWithData:data];   
    
}

+ (BOOL) isValidateCamera{
    NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
       // NSString *errorStr = @"应用相机权限受限,请在设置中启用";
        return NO;
    }
    return YES;
}

static int compare_char(const char *a, const char *b)
{
    if (*a > *b) {
        return 1;
    } else if (*a < *b) {
        return -1;
    } else {
        return 0;
    }
    //return *(char*)a - *(char*)b;
}

+ (NSString *)handleparameter:(NSDictionary *)parameter{
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameter options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    //NSString *temp = [jsonString stringByRemovingPercentEncoding];
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    // 准备对象
    NSString * searchStr = mutStr;
    NSString * regExpStr = @"[^a-zA-Z0-9]";
    NSString * replacement = @"";
    // 创建 NSRegularExpression 对象,匹配 正则表达式
    NSRegularExpression *regExp = [[NSRegularExpression alloc] initWithPattern:regExpStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSString *resultStr = searchStr;
    // 替换匹配的字符串为 searchStr
    resultStr = [[regExp stringByReplacingMatchesInString:searchStr
                                                  options:NSMatchingReportProgress
                                                    range:NSMakeRange(0, searchStr.length)
                                             withTemplate:replacement] uppercaseString] ;
    NSLog(@"\\nsearchStr = %@\\nresultStr = %@",searchStr,resultStr);
    NSMutableArray *charArr = [NSMutableArray array];
    for (int i = 0; i<resultStr.length; i++) {
        NSString *charStr = [resultStr substringWithRange:NSMakeRange(i, 1)];
        [charArr addObject:charStr];
    }
    
    NSArray *serializeArray = [(NSArray *)charArr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {//排序
        int i;
        NSString *strA = obj1;
        NSString *strB = obj2;
        for (i = 0; i < strA.length && i < strB.length; i ++) {
            char a = [strA characterAtIndex:i];
            char b = [strB characterAtIndex:i];
            if (a > b) {
                return (NSComparisonResult)NSOrderedDescending;//上升
            }
            else if (a < b) {
                return (NSComparisonResult)NSOrderedAscending;//下降
            }
        }
    if (strA.length > strB.length) {
        return (NSComparisonResult)NSOrderedDescending;
    }else if (strA.length < strB.length){
        return (NSComparisonResult)NSOrderedAscending;
    }else{
        return (NSComparisonResult)NSOrderedSame;
    }
    }];
    
    NSMutableString *ret = [NSMutableString string];
    for (NSString *obj in serializeArray) {
        if ([obj isKindOfClass:[NSString class]]) {
            [ret appendString:obj];
        }
    }
    return ret;

}
+(NSString *)handleWebParmas:(NSString *)string
{
    NSMutableString *mutStr = [NSMutableString stringWithString:string];
    
    NSString *str1 = [mutStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *str2 = [str1 stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *str3 = [str2 stringByReplacingOccurrencesOfString:@"}" withString:@""];
    NSString *str4 = [str3 stringByReplacingOccurrencesOfString:@"{" withString:@""];
    NSString *str5 = [str4 stringByReplacingOccurrencesOfString:@"]" withString:@""];
    NSString *str6 = [str5 stringByReplacingOccurrencesOfString:@"[" withString:@""];
    NSString *str7 = [str6 stringByReplacingOccurrencesOfString:@"," withString:@""];
    NSString *str8 = [str7 stringByReplacingOccurrencesOfString:@"\'" withString:@""];
    NSString *str9 = [str8 stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    NSString *str10 = [str9 stringByReplacingOccurrencesOfString:@":" withString:@""];
    NSString *str11 = [str10 stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    NSString *str12 = [[str11 stringByReplacingOccurrencesOfString:@"\r" withString:@""] uppercaseString];
    //NSString *str13 = [[str12 stringByReplacingOccurrencesOfString:@"\\" withString:@""] uppercaseString];
   // NSString *str14 = [[str13 stringByReplacingOccurrencesOfString:@"//" withString:@""] uppercaseString];
    
    
    const char *s = [str12 UTF8String];
    char *s2 = (char *) calloc([str12 length]+1, 1);
    if (!s2) return nil;
    strncpy(s2, s, [str12 length]);
    qsort(s2, [str12 length], 1, compare_char);
    NSString *ret = [NSString stringWithUTF8String:s2];
    free(s2);
    return ret;
}

+ (NSString *)handleDouhao:(NSString *)aString{
    NSString * str = [self deleteHeaderAndFooterSpace:aString];
    NSMutableString *mutableStr = [NSMutableString stringWithString:str];
    if (mutableStr.length>0) {
        NSString *first  = [mutableStr substringToIndex:1];
        while ([first isEqualToString:@","]) {
            [mutableStr deleteCharactersInRange:NSMakeRange(0, 1)];

            if (mutableStr.length>0) {
                first  = [mutableStr substringToIndex:1];
            }else{
                first = @"";
            }
        }

        if (mutableStr.length>0) {
            NSString *last = [mutableStr substringFromIndex:mutableStr.length-1];
            while ([last isEqualToString:@","]) {
                 [mutableStr deleteCharactersInRange:NSMakeRange(mutableStr.length-1, 1)];
                if (mutableStr.length>0) {
                    last  = [mutableStr substringFromIndex:mutableStr.length-1];
                }else{
                    first = @"";
                }
            }
        }
        return [NSString stringWithString:mutableStr];
    }
    else{
        return @"";
    }
  
}

+ (NSString *)deleteHeaderAndFooterSpace:(NSString *)aString{
    
    if (aString && aString.length>0) {
        NSString *result = [aString stringByTrimmingLeftCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        result = [result stringByTrimmingRightCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        return result;
    }else{
        return @"";
    }
}


+ (NSString *)deleteFirstAndLastStr:(NSString *)str{
    if (str.length>1) {
        NSString *cutted = [str substringToIndex:([str length]-1)];
        NSMutableString *strs = [NSMutableString stringWithString:cutted];
        [strs deleteCharactersInRange:NSMakeRange(0, 1)];
        return strs;
    }else{
        return str;
    }
}
+ (double)getGenderWithKtp:(NSString *)ktp{
    if ([self isValidateKtp:ktp]) {
        NSString *dd = [ktp substringWithRange:NSMakeRange(6, 2)];
        if ([dd intValue]>31) {
            return 2;
        }else{
            return 1;
        }
    }else{
        return 0;
    }
}

+ (NSInteger)newGetDayintervalFrom:(NSDate *)startDate to:(NSDate *)endDate{
    
    NSInteger endTime = [[NSNumber numberWithDouble:[endDate timeIntervalSince1970]] integerValue];
    NSInteger startTime = [[NSNumber numberWithDouble:[startDate timeIntervalSince1970]] integerValue];
    NSInteger day = (endTime-startTime)/(60*60*24) + 1;
    if ((endTime-startTime)%(60*60*24) == 0) {
        if (day>1) {
            day = day - 1;
        }
    }
    return day;

}


+ (NSDateComponents *)getTimeintervalFrom:(NSDate *)startDate to:(NSDate *)endDate{
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:[self NSDateFormatter:startDate] toDate:[self NSDateFormatter:endDate] options:0];
    return dateCom;
}
+ (NSDate *)NSDateFormatter:(NSDate *)date{
    NSDateFormatter *dateFormtter=[[NSDateFormatter alloc] init];
    [dateFormtter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString=[dateFormtter stringFromDate:date];
    
    NSDate *upDate = [dateFormtter dateFromString:dateString];
    return upDate;
}

+ (BOOL)isValiadAgeTobuyWithKtpNo:(NSString *)ktpNo maxAge:(double)maxAge minAge:(double)minAge{
    
    if ([self isValidateKtp:ktpNo]) {
        // 获取当前日期
        NSDate* current = [NSDate date];
        // 获取代表公历的NSCalendar对象
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        // 获取当前日期
        // 定义一个时间字段的旗标，指定将会获取指定年、月、日、时、分、秒的信息
        unsigned unitFlags = NSCalendarUnitYear |
        NSCalendarUnitMonth |  NSCalendarUnitDay |
        NSCalendarUnitHour |  NSCalendarUnitMinute |
        NSCalendarUnitSecond | NSCalendarUnitWeekday;
        // 获取不同时间字段的信息
        NSDateComponents* comp = [gregorian components: unitFlags
                                              fromDate:current];
        
        NSString *ktpMonth = [ktpNo substringWithRange:NSMakeRange(8, 2)];
        NSString *ktpday;
        ktpday = [ktpNo substringWithRange:NSMakeRange(6, 2)];;
        NSString *ktpYear = [ktpNo substringWithRange:NSMakeRange(10, 2)];
        double ktpDayDouble = [ktpday doubleValue];
        if (ktpDayDouble>40) {
            ktpDayDouble-=40;
            ktpday = [NSString stringWithFormat:@"%.f",ktpDayDouble];
        }
        double ktpYearDouble = [ktpYear doubleValue];
        if (ktpYearDouble<=comp.year-2000) {
            ktpYearDouble+=2000;
        }else{
            ktpYearDouble+=1900;
        }
        NSString *ktpYearStr = [NSString stringWithFormat:@"%@-%@-%.f",ktpMonth,ktpday,ktpYearDouble];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-dd-yyyy"];
        NSDate *date = [dateFormatter dateFromString:ktpYearStr];
        
        NSDateComponents *comps = [self getTimeintervalFrom:date to:current];
        if (comps.year>=minAge&&comps.year<=maxAge) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }

    
}

+ (NSInteger)getAgeWithKtp:(NSString *)ktpNo{
    if (![self isValidateKtp:ktpNo]) {
        return 0;
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSCalendarIdentifierGregorian:iOS8之前用NSGregorianCalendar
    NSString *ktpMonth = [ktpNo substringWithRange:NSMakeRange(8, 2)];
    NSString *ktpday;
    ktpday = [ktpNo substringWithRange:NSMakeRange(6, 2)];;
    NSString *ktpYear = [ktpNo substringWithRange:NSMakeRange(10, 2)];
    
    NSDateComponents *currentComps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    double ktpDayDouble = [ktpday doubleValue];
    if (ktpDayDouble>40) {
        ktpDayDouble-=40;
        
    }
    double ktpYearDouble = [ktpYear doubleValue];
    if (ktpYearDouble<=currentComps.year-2000) {
        ktpYearDouble+=2000;
    }else{
        ktpYearDouble+=1900;
    }
    NSInteger year = ktpYearDouble;
    NSInteger month = [ktpMonth integerValue];
    NSInteger day = ktpDayDouble;
    NSInteger currentYear = currentComps.year;
    NSInteger currentMonth = currentComps.month;
    NSInteger currentDay = currentComps.day;
    
    NSInteger age = currentYear - year;
    if (currentMonth<month) {
        age -= 1;
    }else if (currentMonth == month){
        if (currentDay<day) {
            age -= 1;
        }
    }
    return age;
}

+ (NSString *)getAgeStringWithKtp:(NSString *)ktpNo
{
    if ([self isValidateKtp:ktpNo]) {
        // 获取当前日期
        NSDate* current = [NSDate date];
        // 获取代表公历的NSCalendar对象
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        // 获取当前日期
        // 定义一个时间字段的旗标，指定将会获取指定年、月、日、时、分、秒的信息
        unsigned unitFlags = NSCalendarUnitYear |
        NSCalendarUnitMonth |  NSCalendarUnitDay |
        NSCalendarUnitHour |  NSCalendarUnitMinute |
        NSCalendarUnitSecond | NSCalendarUnitWeekday;
        // 获取不同时间字段的信息
        NSDateComponents* comp = [gregorian components: unitFlags
                                              fromDate:current];
        
        NSString *ktpMonth = [ktpNo substringWithRange:NSMakeRange(8, 2)];
        NSString *ktpday;
        ktpday = [ktpNo substringWithRange:NSMakeRange(6, 2)];;
        NSString *ktpYear = [ktpNo substringWithRange:NSMakeRange(10, 2)];
        double ktpDayDouble = [ktpday doubleValue];
        if (ktpDayDouble>40) {
            ktpDayDouble-=40;
            ktpday = [NSString stringWithFormat:@"%02.f",ktpDayDouble];
        }
        double ktpYearDouble = [ktpYear doubleValue];
        if (ktpYearDouble<=comp.year-2000) {
            ktpYearDouble+=2000;
        }else{
            ktpYearDouble+=1900;
        }
        NSString *ktpYearStr = [NSString stringWithFormat:@"%@/%@/%.f",ktpday,ktpMonth,ktpYearDouble];
        return ktpYearStr;
    }
    else{
        return @"";
    }
}

#pragma mark - Helper

+ (NSMutableAttributedString *)covertAttributeUsingFullStr:(NSString *)fullStr attrStr:(NSString *)attrStr{
    if (!fullStr && [fullStr isEqualToString:@""]) {
        return nil;
    }
    
    NSMutableAttributedString *attrDescribeStr = [[NSMutableAttributedString alloc] initWithString:fullStr];
    
    if (![fullStr containsString:attrStr]) {
        return attrDescribeStr;
    }
    
    [attrDescribeStr addAttribute:NSForegroundColorAttributeName
                            value:[UIColor whiteColor]
                            range:[fullStr rangeOfString:fullStr]];
    [attrDescribeStr addAttribute:NSUnderlineStyleAttributeName
                            value:@(NSUnderlineStyleSingle)
                            range:[fullStr rangeOfString:attrStr]];
    [attrDescribeStr addAttribute:NSUnderlineColorAttributeName
                            value:[UIColor whiteColor]
                            range:[fullStr rangeOfString:attrStr]];
    return attrDescribeStr;
}

+ (BOOL)isSameDay:(NSDate *)effectDate endData:(NSDate *)endDate {
    
    return [[NSCalendar currentCalendar] isDate:effectDate inSameDayAsDate:endDate];;
}

+ (BOOL)isVaildInPeroidDate:(NSDate *)selectedStartDate selectedEndDate:(NSDate *)selectedEndDate cycle:(int)cycle unit:(int)units{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSDateComponents *comps = nil;
    
   // comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:selectedStartDate];
    int year,month,day;
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    if (units==3) {
        year = 0;
        month = 0;
        if(cycle == 0){
            day = cycle;
        }
        else{
            day = cycle - 1;
        }
        
    }else if (units == 2){
        year = 0;
        day = 0;
        month = cycle;
        
    }else{
        month = 0;
        day = 0;
        year = cycle;
    }
    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];
    NSDate *exceptEndDate = selectedEndDate;
    exceptEndDate = [NSDate dateWithTimeInterval:0 sinceDate:[calendar dateByAddingComponents:adcomps toDate:selectedStartDate options:0]];
    if (units == 2 || units == 1) {
        exceptEndDate = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:[calendar dateByAddingComponents:adcomps toDate:selectedStartDate options:0]];
    }
    NSInteger exceptDay = ([exceptEndDate timeIntervalSince1970] - [selectedStartDate timeIntervalSince1970]) / (24 * 60 * 60);
    NSLog(@"%f",[selectedEndDate timeIntervalSince1970]);
    NSLog(@"%f",[selectedStartDate timeIntervalSince1970]);
    NSLog(@"%f",[selectedEndDate timeIntervalSince1970] - [selectedStartDate timeIntervalSince1970]);
    NSInteger acturalDay = ([selectedEndDate timeIntervalSince1970] - [selectedStartDate timeIntervalSince1970]) / (24 * 60 * 60);
    
    if (exceptDay - acturalDay >= 0) {
        return YES;
    }
    return NO;
}

+ (double)caculateImageSize:(UIImage *)image{
    NSData *data = UIImagePNGRepresentation(image);
    if (!data) {
        data = UIImageJPEGRepresentation(image, 0.5);//需要改成0.5才接近原图片大小，原因请看下文
    }
    double dataLength = [data length] * 1.0;
    
    return dataLength;
}

+ (NSString *)base64Encode:(NSString *)string
{
    //先将string转换成data
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    
    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    
    return baseString;
}


//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        
        currentVC = rootVC;
    }
    
    return currentVC;
}

- (NSString *)formatDoubleTo02String:(double)points roundingMode:(NSRoundingMode)roundingMode {
    
    NSDecimalNumber * decimal = [[NSDecimalNumber alloc] initWithDouble:points];
    NSDecimalNumber * decimalP = [[NSDecimalNumber alloc] initWithDouble:1];
    
    NSDecimalNumberHandler *hander = [[NSDecimalNumberHandler alloc] initWithRoundingMode:roundingMode scale:2 raiseOnExactness:false raiseOnOverflow:false raiseOnUnderflow:false raiseOnDivideByZero:true];
    
    NSDecimalNumber *result = [decimal decimalNumberByDividingBy:decimalP withBehavior:hander];
    
    return result.stringValue;
}


+ (CGFloat)getLaeblTextHeight:(NSString *)text font:(UIFont *)font width:(NSInteger)width{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
//Attribute传和label设定的一样
    NSDictionary * attributes = @{
                                  NSFontAttributeName:font,
                                  NSParagraphStyleAttributeName: paragraphStyle
                                  };
//这里的size，width传label的宽，高默认都传MAXFLOAT
    CGSize textRect = CGSizeMake(width, MAXFLOAT);
    CGFloat textHeight = [text boundingRectWithSize: textRect
                                           options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                        attributes:attributes
                                           context:nil].size.height;
    return textHeight;
}

+ (NSString *)formatText:(NSString *)text {
    if ([FUTools isEmptyString:text]) {
        return @"-";
    }
    return text;
}

+ (NSString *)formatterMoney:(NSString *)money {
    
    if (money.length < 4) {
        return money;
    }
    
    NSInteger start = money.length % 3;
    NSString *doneTitle = [money substringWithRange:NSMakeRange(0, start)];
    if (start > 0) {
        doneTitle = [NSString stringWithFormat:@"%@.", doneTitle];
    }
    
    int count = 0;
    for (NSInteger i = start; i < money.length; i++) {
        
        count++;
        doneTitle = [doneTitle stringByAppendingString:[money substringWithRange:NSMakeRange(i, 1)]];
        if (count == 3) {
            doneTitle = [NSString stringWithFormat:@"%@.", doneTitle];
            count = 0;
        }
    }
    
    return [doneTitle substringToIndex:doneTitle.length-1];
}


@end
