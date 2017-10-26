//
//  ColorPicker.m
//  CustomUIControl
//
//  Created by Backman on 2017/10/23.
//  Copyright © 2017年 Backman. All rights reserved.
//

#import "ColorPicker.h"

@implementation ColorPicker{

    UIColor* pColor;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



// 1. init from frame

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        self.layer.cornerRadius=frame.size.width/2;
        NSLog(@"%@ is init",[self class]);
    }
    return self;
}

/*
-(instancetype)initWithCoder:(NSCoder *)aDecoder{


}
*/




 
 -(BOOL) beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
 {
 
     [self sendActionsForControlEvents:UIControlEventTouchDown];
 
     [self genColorFromTouch:touch];
     return YES;
     
     
 }
 





//UITouch event to color
-(void)genColorFromTouch:(UITouch*) touch
{
    
    CGPoint touchPoint = [touch locationInView:self];
    float hue = touchPoint.x / self.frame.size.width;
    float saturation = touchPoint.y/ self.frame.size.height;
    pColor = [UIColor colorWithHue:hue saturation:saturation brightness:1.0f alpha:1.0f];
    
    self.backgroundColor = pColor;

    [self sendActionsForControlEvents:UIControlEventValueChanged];

}



- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    // Test if drag is currently inside or outside
    CGPoint touchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(self.bounds, touchPoint))
    {
        // Update color value
        [self genColorFromTouch:touch];
        
        [self sendActionsForControlEvents:UIControlEventTouchDragInside];
    }
    else
    {
        [self sendActionsForControlEvents:UIControlEventTouchDragOutside];
    }
    
    return YES;
}


- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    // Test if touch ended inside or outside
    CGPoint touchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(self.bounds, touchPoint))
    {
        // Update color value
        [self genColorFromTouch:touch];
        
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        [self sendActionsForControlEvents:UIControlEventTouchUpOutside];
    }
}

// Handle touch cancel
- (void)cancelTrackingWithEvent:(UIEvent *)event
{
    [self sendActionsForControlEvents:UIControlEventTouchCancel];
}



@end
