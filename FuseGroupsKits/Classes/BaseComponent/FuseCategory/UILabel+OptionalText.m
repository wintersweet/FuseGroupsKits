//
//  UILabel+OptionalText.m
//  FUSEPRO
//
//  Created by Ch666 on 2018/12/19.
//  Copyright © 2018年 FUSENANO. All rights reserved.
//

#import "UILabel+OptionalText.h"

@implementation UILabel (OptionalText)
- (void)addOriginalText:(NSString *)orginalText isOptional:(BOOL)optional{
    if (optional) {
        
        self.text = [NSString stringWithFormat:@"%@",orginalText];
    }else{
        NSMutableAttributedString *attrDescribeStrCom = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",orginalText,@"＊"]];
        
        
        [attrDescribeStrCom addAttribute:NSForegroundColorAttributeName
         
                                   value:[UIColor redColor]
         
                                   range:[[NSString stringWithFormat:@"%@%@",orginalText,@"＊"] rangeOfString:@"＊"]];
        self.attributedText =attrDescribeStrCom;
    }
}
@end
