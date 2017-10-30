//
//  circleSlider.m
//  CustomUIControl
//
//  Created by Backman on 2017/10/30.
//  Copyright © 2017年 Backman. All rights reserved.
//

#import "CircleSlider.h"

@implementation CircleSlider

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




-(instancetype) initWithFrame:(CGRect)frame{


    self = [super initWithFrame:frame];
    
    if (self){
    
        
        for(int idx=0 ;idx<5; idx++){
            
            //temporary
            float yMargin =10;
            float xMargin =10;
            UIImageView* circle = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width/5-2*xMargin,frame.size.height-yMargin*2) ];
            circle.center = CGPointMake(circle.frame.size.width/2+xMargin+idx*(2*xMargin+circle.frame.size.width),frame.size.height/2);
            circle.backgroundColor = [UIColor whiteColor];
            circle.layer.cornerRadius= circle.frame.size.width/2;
            [self addSubview:circle];
        
        
        }
        
        
        
        
        
    
    }

    return self;


}



//may be let circle triger the event.
-(void) updateCirleStatus:(UITouch*) touch{

    CGPoint p=[touch locationInView:self];
    _ratingValue =0;
    for(UIImageView* c in self.subviews){
    
        if(p.x < c.frame.origin.x){
        
            c.backgroundColor=[UIColor whiteColor];
            
        }
        else{
        
            c.backgroundColor=[UIColor blueColor];
            _ratingValue++;
            
        }
    
    
    }


    NSLog(@"%@ is %ld",[CircleSlider class],(long)_ratingValue);


}



- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    
    
    [self updateCirleStatus:touch];
    
    [self sendActionsForControlEvents:UIControlEventTouchDown];




    return YES;
}

-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    
    
    
    if (CGRectContainsPoint(self.frame, [touch locationInView:self])){
        [self sendActionsForControlEvents:UIControlEventTouchDragInside];
       

    }
    else
        [self sendActionsForControlEvents:UIControlEventTouchDragOutside];
    
    [self updateCirleStatus:touch];
    
    
    return YES;
}


- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    
    
    if (CGRectContainsPoint(self.bounds, [touch locationInView:self]))
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    else
        [self sendActionsForControlEvents:UIControlEventTouchUpOutside];

    [self updateCirleStatus:touch];

    return ;
}






@end
