//
//  IS24AppDelegate.m
//  CI-Demo
//
//  Created by Schulze, Felix on 01.10.2012.
//  Copyright (c) 2012 ImmobilienScout24. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import "IS24AppDelegate.h"

#import "IS24ExampleViewController.h"
#if RUN_KIF_TESTS
#import "IS24IntegrationTestController.h"
#endif
@implementation IS24AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[IS24ExampleViewController alloc] initWithNibName:@"IS24ExampleViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
#if RUN_KIF_TESTS
    [[IS24IntegrationTestController sharedInstance] startTestingWithCompletionBlock:^{
    }];
#endif
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
