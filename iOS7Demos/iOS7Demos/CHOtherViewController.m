//
//  CHOtherViewController.m
//  iOS7Demos
//
//  Created by hangchen on 11/14/13.
//  Copyright (c) 2013 hangchen. All rights reserved.
//

#import "CHOtherViewController.h"

@interface CHOtherViewController ()

@end

@implementation CHOtherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
	// Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setFrame:CGRectMake((self.view.frame.size.width - 50) / 2.0, (self.view.frame.size.height - 50) / 2.0, 50, 50)];
    [button setTitle:@"close" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    if (self.isMotionEffectEnabled) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 100) / 2.0, (self.view.frame.size.height - 100) / 2.0 + 100, 100, 100)];
        label.layer.borderWidth = 1;
        label.backgroundColor = [UIColor yellowColor];
        label.layer.borderColor = [UIColor blackColor].CGColor;
        label.numberOfLines = 0;
        label.font = [UIFont boldSystemFontOfSize:15];
        label.text = @"Tilt your phone to see what happend.";
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
        
        
        
        UIInterpolatingMotionEffect *effectX;
        UIInterpolatingMotionEffect *effectY;
        effectX = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                  type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        effectY = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                  type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        
        
        effectX.maximumRelativeValue = @(40);
        effectX.minimumRelativeValue = @(-40);
        effectY.maximumRelativeValue = @(40);
        effectY.minimumRelativeValue = @(-40);
        
        UIMotionEffectGroup *effectGroup = [[UIMotionEffectGroup alloc] init];
        effectGroup.motionEffects = [NSMutableArray arrayWithObjects:effectX,effectY, nil];
        
        [label addMotionEffect:effectGroup];
        
    }
    
    
}

- (void)dismiss
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
