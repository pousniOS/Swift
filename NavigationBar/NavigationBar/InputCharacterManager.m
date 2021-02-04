//
//  InputCharacterManager.m
//  NavigationBar
//
//  Created by mac on 2021/2/4.
//

#import "InputCharacterManager.h"
#import "LimitInput.h"

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

-(void)didBeginEditing:(NSNotification *)sender{
    
}
-(void)didEndEditing:(NSNotification *)sender{
    
}
-(void)didChange:(NSNotification *)sender{
    
}

@end
