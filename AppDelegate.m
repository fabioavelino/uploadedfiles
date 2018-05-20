/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@implementation AppDelegate

- (void)download {
  NSString *stringURL = @"https://raw.githubusercontent.com/fabioavelino/uploadedfiles/master/main.jsbundle";
  NSURL *url = [NSURL URLWithString:stringURL];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  NSError *error = nil;
  NSURLResponse* response = nil;
  NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
  
  NSString *home = NSHomeDirectory();
  
  NSString  *nameFile = @"/Documents/main.jsbundle";
  
  NSString *filePath = [home stringByAppendingString:nameFile];
  
  NSLog(filePath);
  
  [data writeToFile:filePath atomically:YES];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [self download];

  //jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];

 // NSString *codeLocation = @"https://raw.githubusercontent.com/fabioavelino/uploadedfiles/master/main2";
  
  NSString *file = @"file://";
  
  NSString *home = NSHomeDirectory();
  
  NSString *homefile = [file stringByAppendingString:home];
  
  NSString  *nameFile = @"/Documents/main";
  
  NSString *filePath = [homefile stringByAppendingString:nameFile];
  
  NSURL *jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"testApp"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
