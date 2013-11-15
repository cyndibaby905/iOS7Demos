//
//  CHAnimatedTransitioning.h
//  iOS7Demos
//
//  Created by hangchen on 11/14/13.
//  Copyright (c) 2013 hangchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL reverse;

@end

@interface CHTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>


@end


@interface CHNavigationTransitioningDelegate : NSObject <UINavigationControllerDelegate>

@end