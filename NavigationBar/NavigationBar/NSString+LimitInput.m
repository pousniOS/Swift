//
//  NSString+LimitInput.m
//  NavigationBar
//
//  Created by mac on 2021/2/4.
//

#import "NSString+LimitInput.h"
static NSString* lowerCaseLetters(){
    static NSString *_lowerCaseLetters = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *lowerCaseLetters = @[
            @"q", @"w", @"e", @"r", @"t", @"y", @"u", @"i", @"o", @"p",
            @"a", @"s", @"d", @"f", @"g", @"h", @"j", @"k", @"l",
            @"z", @"x", @"c", @"v", @"b", @"n", @"m"
        ];
        _lowerCaseLetters = [lowerCaseLetters componentsJoinedByString:@""];
        
    });
    return _lowerCaseLetters;
}

static NSString* upperCaseLetter(){
    static NSString *_upperCaseLetter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *upperCaseLetter = @[
            @"Q", @"W", @"E", @"R", @"T", @"Y", @"U", @"I", @"O", @"P",
            @"A", @"S", @"D", @"F", @"G", @"H", @"J", @"K", @"L",
            @"Z", @"X", @"C", @"V", @"B", @"N", @"M"
        ];
        _upperCaseLetter = [upperCaseLetter componentsJoinedByString:@""];
        
    });
    return _upperCaseLetter;
}

static NSString* number(){
    static NSString *_number = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *number = @[
            @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"
        ];
        _number = [number componentsJoinedByString:@""];
    });
    return _number;
}

static NSString* englishPunctuation(){
    static NSString *_englishPunctuation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *englishPunctuation = @[
            @"`", @"~" , @"!", @"@", @"#", @"\$", @"%", @"\^", @"&" , @"\*", @"\(", @")", @"_" ,
            @"-", @"\+", @"=", @"{", @"}", @"\[", @"]", @"\\", @"\|", @"<" , @">" , @",", @"\.",
            @"/", @"\?", @";", @":", @"'", @"\"", @" "
        ];
        _englishPunctuation = [englishPunctuation componentsJoinedByString:@""];
    });
    return _englishPunctuation;
}

static NSString* otherPunctuation(){
    static NSString *_otherPunctuation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *otherPunctuation = @[
        ];
        _otherPunctuation = [otherPunctuation componentsJoinedByString:@""];
    });
    return _otherPunctuation;
}

@implementation NSString (LimitInput)

-(BOOL)isValid{
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[[a-z ]&&[^acdkn]]+"];
    return [predicate1 evaluateWithObject:self]
}

@end
