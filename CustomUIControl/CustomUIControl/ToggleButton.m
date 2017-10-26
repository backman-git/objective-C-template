//
//  ToggleButton.m
//  CustomUIControl
//
//  Created by Backman on 2017/10/24.
//  Copyright © 2017年 Backman. All rights reserved.
//

#import "ToggleButton.h"

@implementation ToggleButton{


    NSString* cName;


}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



-(instancetype)initWithFrame:(CGRect)frame{

    cName=@"ToggleButton";
    self = [super initWithFrame:frame];
    
    
    if(self){
    
        // font
        self.titleLabel.font = [UIFont boldSystemFontOfSize:30.0f];
        [self setTitle:@"on" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightTextColor] forState:UIControlStateHighlighted];
        self.contentVerticalAlignment =UIControlContentVerticalAlignmentCenter;
        self.contentHorizontalAlignment =UIControlContentHorizontalAlignmentCenter;

        
        
        [self addTarget:self action:@selector(toggleHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        NSLog(@"%@ button init",cName);
    }
    return self;




}

-(void)toggleHandler:(UIButton*) btn{

    
    NSLog(@"%@: toggleHandler function",cName);

    [self setTitle:@"off" forState:UIControlStateNormal];
    


}




@end
