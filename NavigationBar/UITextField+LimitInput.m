//
//  UITextField+Category.m
//  Pokio
//
//  Created by longzezhen on 2018/12/10.
//  Copyright © 2018年 深圳趣凡网络科技有限公司. All rights reserved.
//
 
#import "UITextField+LimitInput.h"
#import <objc/runtime.h>
static char UITextFieldAvailableCharacterSetKey;
static char UITextFieldTextLastStringKey;
@implementation UITextField (Category)
-(AvailableCharacterSet)availableCharacterSet{
    return [objc_getAssociatedObject(self, &UITextFieldAvailableCharacterSetKey) boolValue];
}
-(void)setAvailableCharacterSet:(AvailableCharacterSet)availableCharacterSet{
    objc_setAssociatedObject(self, &UITextFieldAvailableCharacterSetKey, @(availableCharacterSet), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BOOL)isValid:(NSString *)string{
    return NO;
}
-(NSString*)lastString{
    return objc_getAssociatedObject(self, &UITextFieldTextLastStringKey);
}
-(void)setLastString:(NSString *)lastString{
    objc_setAssociatedObject(self, &UITextFieldTextLastStringKey, lastString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end

