//
//  TestBlock.h
//  Object-CStudent
//
//  Created by mac on 2020/12/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestBlock : NSObject
-(void)run:(void(^)(void))block;
@end

NS_ASSUME_NONNULL_END
