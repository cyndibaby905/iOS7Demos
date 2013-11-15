//
//  CHAnimatedTransitioning.m
//  iOS7Demos
//
//  Created by hangchen on 11/14/13.
//  Copyright (c) 2013 hangchen. All rights reserved.
//

#import "CHAnimatedTransitioning.h"
static NSTimeInterval const DETAnimatedTransitionDuration = 0.5f;
static NSTimeInterval const DETAnimatedTransitionDurationForMarco = 0.15f;

@implementation CHAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    if (self.reverse) {
        [container insertSubview:toViewController.view belowSubview:fromViewController.view];
    }
    else {
        toViewController.view.transform = CGAffineTransformMakeScale(0, 0);
        [container addSubview:toViewController.view];
    }
    
    [UIView animateKeyframesWithDuration:DETAnimatedTransitionDuration delay:0 options:0 animations:^{
        if (self.reverse) {
            fromViewController.view.transform = CGAffineTransformMakeScale(0, 0);
        }
        else {
            toViewController.view.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return DETAnimatedTransitionDuration;
}

@end



@implementation CHTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    CHAnimatedTransitioning *transitioning = [CHAnimatedTransitioning new];
    return transitioning;
}


- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    CHAnimatedTransitioning *transitioning = [CHAnimatedTransitioning new];
    transitioning.reverse = YES;
    return transitioning;
}

@end



@implementation CHNavigationTransitioningDelegate

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
animationControllerForOperation:(UINavigationControllerOperation)operation
fromViewController:(UIViewController *)fromVC
toViewController:(UIViewController *)toVC
{
    CHAnimatedTransitioning *transitioning = [CHAnimatedTransitioning new];
   
    if (UINavigationControllerOperationPush == operation) {
        transitioning.reverse = NO;
    }
    else {
        transitioning.reverse = YES;
    }
    return transitioning;
}

@end