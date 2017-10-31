//
//  ObjWithBlock.h
//  GCD Demo
//
//  Created by Backman on 2017/10/30.
//  Copyright © 2017年 Backman. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NSString* (^blockMethod)(NSInteger value);
typedef NSString* (^blockMethodWithSelf)(id obj) ;

@interface ObjWithBlock : NSObject
@property int classMember;
-(void) methodWithBlock: (blockMethod) a;
-(void) methodAccessSelf;
@end
