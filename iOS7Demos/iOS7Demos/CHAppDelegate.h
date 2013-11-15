//
//  CHAppDelegate.h
//  iOS7Demos
//
//  Created by hangchen on 11/14/13.
//  Copyright (c) 2013 hangchen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHTransitioningDelegate;
@class CHNavigationTransitioningDelegate;
@interface CHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) CHTransitioningDelegate *transitioningDelegate;
@property (nonatomic, strong) CHNavigationTransitioningDelegate *navigationTransitioningDelegate;
@end
