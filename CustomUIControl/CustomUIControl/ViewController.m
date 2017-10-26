//
//  ViewController.m
//  CustomUIControl
//
//  Created by Backman on 2017/10/22.
//  Copyright © 2017年 Backman. All rights reserved.
//

#import "ViewController.h"
#import "BXUImageView.h"
#import "ToggleButton.h"
#import "BXButtonFactory.h"
#import "ColorPicker.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIImage* t = [UIImage imageNamed:@"t" ];
    UIImageView* tView1 = [[BXUImageView alloc] initWithImage:t];
    tView1.frame = CGRectMake(100,100,100,100);
    
    UIImageView* tView2 = [[BXUImageView alloc] initWithImage:t];
    
    tView2.frame = CGRectMake(110,110, 200, 200);
    
    
   // [self.view addSubview:tView1];
   // [self.view addSubview:tView2];
    
    //button inherit
   /*
    ToggleButton* btn = [[ToggleButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:btn];
    
    
    UIButton* b1 = [BXButtonFactory getButton:@"Toggle"];
    b1.frame = CGRectMake(0, 0,100,100);
    
    
    
    
    [self.view addSubview:b1];
    UIButton*b2 = [BXButtonFactory getButton:@"Switch"];
    b2.frame = CGRectMake(100,100,100,100);
    [self.view addSubview:b2];
    
    */
    ColorPicker* cPicker = [[ColorPicker alloc] initWithFrame:CGRectMake(10,10, 200,200 )];
    [self.view addSubview:cPicker];
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
