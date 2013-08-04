//
//  BJQAppDelegate.m
//  iOS-XMLDOM-demo
//
//  Created by kevin on 13-5-28.
//  Copyright (c) 2013年 BJQ. All rights reserved.
//

#import "BJQAppDelegate.h"

#import "BJQViewController.h"
#import "UserModel.h"
#import "AAAViewController.h"
@implementation BJQAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UserModel *um = [UserModel shareUserModel];;
    [um printXMLUseDOM];

    
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[BJQViewController alloc] initWithNibName:@"BJQViewController" bundle:nil] autorelease];
    self.viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"city" image:nil tag:100];

 
    AAAViewController *aaa = [[AAAViewController alloc] initWithNibName:@"AAAViewController" bundle:nil];
    aaa.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"country" image:nil tag:110];
    self.tabC = [[UITabBarController alloc] init];
    self.tabC.viewControllers = @[self.viewController,aaa];
    self.window.rootViewController = self.tabC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
