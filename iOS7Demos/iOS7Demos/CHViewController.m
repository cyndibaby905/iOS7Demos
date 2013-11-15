//
//  CHViewController.m
//  iOS7Demos
//
//  Created by hangchen on 11/14/13.
//  Copyright (c) 2013 hangchen. All rights reserved.
//

#import "CHViewController.h"
#import "CHAnimatedTransitioning.h"
#import "CHAppDelegate.h"
#import "CHOtherViewController.h"

@interface CHViewController ()

@end

@implementation CHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.transitioningDelegate = [(CHAppDelegate*)[UIApplication sharedApplication].delegate transitioningDelegate];
    
   
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Motion effect";
            break;
        case 1:
            cell.textLabel.text = @"Custom Transitioning(ModalViewController)";
            break;
        case 2:
            cell.textLabel.text = @"Custom Transitioning(NavigationViewController)";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            CHOtherViewController *other = [CHOtherViewController new];
            other.isMotionEffectEnabled = YES;
            [self presentViewController:other animated:YES completion:nil];
        
        }
            break;
        case 1:
        {
            CHOtherViewController *other = [CHOtherViewController new];
            other.transitioningDelegate = self.transitioningDelegate;
            [self presentViewController:other animated:YES completion:nil];
        }
            break;
        case 2:
        {
            CHOtherViewController *other = [CHOtherViewController new];
            self.navigationController.delegate = [(CHAppDelegate*)[UIApplication sharedApplication].delegate navigationTransitioningDelegate];
            [self.navigationController pushViewController:other animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
