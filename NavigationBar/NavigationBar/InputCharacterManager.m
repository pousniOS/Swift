//
//  InputCharacterManager.m
//  NavigationBar
//
//  Created by mac on 2021/2/4.
//

#import "InputCharacterManager.h"
#import "LimitInput.h"


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


@interface InputCharacterManager()
@property(nonatomic,strong)NSMutableDictionary<NSNumber*,NSPredicate*> *predicates;
@end

@implementation InputCharacterManager
+(void)load{
    [self performSelectorOnMainThread:@selector(sharedManager) withObject:nil waitUntilDone:NO];
}
+(instancetype)sharedManager{
    static dispatch_once_t onceToken;
    static InputCharacterManager *_InputCharacterManager = nil;
    dispatch_once(&onceToken, ^{
        _InputCharacterManager = [[super allocWithZone:NULL] init];
    });
    return _InputCharacterManager;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}
-(id)copyWithZone:(NSZone *)zone{
    return [self.class sharedManager];
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return [self.class sharedManager];
}
-(instancetype)init{
    self = [super init];
    if (self == nil) {
        return nil;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self registerNotfications];
    });
    return self;
}

-(void)registerNotfications{
    //UITextFiled通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChange:) name:UITextFieldTextDidChangeNotification object:nil];

    //UITextView通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndEditing:) name:UITextViewTextDidEndEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChange:) name:UITextViewTextDidChangeNotification object:nil];
}
-(NSPredicate *)getPredicateWithCharacterSet:(AvailableCharacterSet)set{
    NSPredicate *predicate = _predicates[@(set)];
    return _predicates[@(set)];
}
-(BOOL)isValidWithString:(NSString *)string andAvailableCharacterSet:(AvailableCharacterSet)set{
    
    
    if (set&AvailableCharacterSetLowerCaseLetters){

    }else if (set&AvailableCharacterSetUpperCaseLetter){
        
    }else if (set&AvailableCharacterSetNumber){
        
    }else if (set&AvailableCharacterSetEnglishPunctuation){
        
    }else if (set&AvailableCharacterSetOtherPunctuation){

    }else if (set&AvailableCharacterSetAll){
        
    }
    return YES;
}
-(void)didBeginEditing:(NSNotification *)sender{
    
}
-(void)didEndEditing:(NSNotification *)sender{
    
}
-(void)didChange:(NSNotification *)sender{
}
@end
