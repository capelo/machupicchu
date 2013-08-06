//
//  AppDelegate.h
//  X
//
//  Created by Roberto Capelo on 30/05/11.
//  Copyright Core do Brasil 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
