//
//  main.m
//  GCD Demo
//
//  Created by Backman on 2017/10/30.
//  Copyright © 2017年 Backman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjWithBlock.h"

typedef NSString* (^intToString)(NSInteger a);

typedef void (^counterToTen)(void);

void fnWithBlockArgument(intToString block){

    NSLog(@"in fnWithBlockArgument: %@",block(8));

}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        
       
        
        
        
        int i =53;
        //block
        void (^simpleBlock)(void) = ^(void){
            NSLog(@"The value of i is %i", i);
        };
        
        simpleBlock();
        
        
        //initial block object
        intToString  initBlock = ^(NSInteger a){
            NSString *result = [NSString stringWithFormat:@"init block: %lu",a];
            return result;
        };
        
        fnWithBlockArgument(initBlock);
        
        //anonymous
        fnWithBlockArgument(^NSString*(NSInteger a){
            NSString *result = [NSString stringWithFormat:@"in anonymous block %lu",a];
            return result;});
        
        

        
        ObjWithBlock* objWithBlock = [[ObjWithBlock alloc] init];
        [objWithBlock methodWithBlock: initBlock];
        [objWithBlock methodWithBlock: ^NSString*(NSInteger a){ return @"anonymous";  } ];
        
        [objWithBlock methodAccessSelf];
        
        
        
        //GCD
        //mainQueue
        
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        
        dispatch_async(mainQueue,^void(void){
            
            NSLog(@"Current thread = %@", [NSThread currentThread]);
            NSLog(@"Main thread = %@", [NSThread mainThread]);
            
            
        });
        
        
        //concurrentQueue
        
        counterToTen codeBlock = ^{
        
            NSUInteger counter = 0;
            for (counter = 1;counter <= 1000; counter++)
                NSLog(@"Counter = %lu - Thread = %@", (unsigned long)counter,[NSThread currentThread]);
                      
            
            
        };
        
        dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        //dispatch_sync  通常會使用在 async 裡面同步
        dispatch_sync(concurrentQueue,codeBlock);
        dispatch_sync(concurrentQueue,codeBlock);
        NSLog(@"dispatch_sync");


       
       
        
        
    }
    
    
    
    

    
    
    return 0;
}



