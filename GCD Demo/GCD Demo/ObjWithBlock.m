//
//  ObjWithBlock.m
//  GCD Demo
//
//  Created by Backman on 2017/10/30.
//  Copyright © 2017年 Backman. All rights reserved.
//

#import "ObjWithBlock.h"

@implementation ObjWithBlock








-(void) methodWithBlock: (blockMethod) a{


    NSLog(@"%@ methodWithBlock %@",[self class],a(10));


}

-(void) methodAccessSelf{

    _classMember=123;
    
    blockMethodWithSelf bm;
    
    
    bm = ^NSString* (id obj){
    
        
        return [NSString stringWithFormat:@"methodAccessSelf %d",((ObjWithBlock*) obj).classMember ];
    };

    NSLog(@"%@" ,bm(self));
}


@end
