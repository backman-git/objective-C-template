//
//  BXUImageView.m
//  CustomUIControl
//
//  Created by Backman on 2017/10/23.
//  Copyright © 2017年 Backman. All rights reserved.
//

#import "BXUImageView.h"

@implementation BXUImageView{

    NSString* cName;
    
    CGPoint startLocation;
    CGPoint initLocation;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (instancetype)initWithImage:(UIImage *)anImage
{
    self = [super initWithImage:anImage];
    if (self)
    {
        self.userInteractionEnabled = YES;
        cName = @"BXUImageView";
        
        UIPanGestureRecognizer* panGesturer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:) ];
        self.gestureRecognizers = @[panGesturer];
        

    
    }
    return self;
}


-(void) panHandler:(UIPanGestureRecognizer*) sender
{

    CGPoint tranlsation= [sender translationInView:self.superview];
    self.center = CGPointMake(startLocation.x+tranlsation.x, startLocation.y+tranlsation.y);
    



}


- (void)setFrame:(CGRect)frame
{
    super.frame = frame;
    
    initLocation = CGPointMake(frame.origin.x+frame.size.width/2,frame.origin.y+frame.size.height/2);


}




- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event
{
    // startLocation = [[touches anyObject] locationInView:self];
    
    startLocation = self.center;
    NSLog(@"begin %@ %@",cName,NSStringFromCGPoint(startLocation));
    [self.superview bringSubviewToFront:self];
}

/*

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent *)event
{
    // Calculate offset
    CGPoint pt = [[touches anyObject] locationInView:self];
    float dx = pt.x - startLocation.x;
    float dy = pt.y - startLocation.y;
    CGPoint newcenter = CGPointMake(self.center.x + dx, self.center.y + dy);
    
    // Set new location
    NSLog(@"move %@ %@",cName,NSStringFromCGPoint(newcenter));
    self.center = newcenter;
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    self.center =initLocation;

    
}
 */



@end
