//
//  BXButtonFactory.m
//  CustomUIControl
//
//  Created by Backman on 2017/10/24.
//  Copyright © 2017年 Backman. All rights reserved.
//

#import "BXButtonFactory.h"

@implementation BXButtonFactory

+ (void)zoomButton:(UIButton *)aButton
{
    [UIView animateWithDuration:0.2f
            animations:^{
                         aButton.transform = CGAffineTransformMakeScale(3.0f, 3.0f);
                NSLog(@"animation");
            }
     
     ];
}



+(id) getButton: (NSString*) type
{

    UIButton* btn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    
    
    if([type isEqualToString:@"Toggle"])
    {
        [btn setTitle:@"Toggle" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightTextColor] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(zoomButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    else if([type isEqualToString:@"Switch"])
    {
        [btn setTitle:@"on" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightTextColor] forState:UIControlStateHighlighted];

    }
    
    
    
    
    return btn;

}

@end
