//
//  AppDelegate.m
//  UI
//
//  Created by Leo Natan (Wix) on 4/8/19.
//  Copyright © 2019 Leo Natan. All rights reserved.
//

#import "AppDelegate.h"
#import <DetoxRecorder/DTXUIInteractionRecorder.h>

@interface AppDelegate () <DTXUIInteractionRecorderDelegate>

@end

@implementation AppDelegate

- (BOOL)interactionRecorderShouldExitApp
{
//	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//		[DTXUIInteractionRecorder startRecording];
//	});

	return YES;
}

//- (void)interactionRecorderDidEndRecordingWithTestCommands:(NSArray<NSString *> *)testCommands
//{
//	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//		[DTXUIInteractionRecorder beginRecording];
//	});
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	
	[DTXUIInteractionRecorder setDelegate:self];
	
	[NSNotificationCenter.defaultCenter addObserverForName:nil object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
		if([note.name isEqualToString:@"UIViewAnimationDidStopNotification"] || [note.name isEqualToString:@"UIViewAnimationDidCommitNotification"])
		{
			return;
		}
		
//		if(note.userInfo[@"UIWindowFirstResponderUserInfoKey"] == nil)
//		{
//			return;
//		}
		
//		if([note.name containsString:@"Scroll"])
//		{
//			NSLog(@"🤟 %@", note);
//		}
	}];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
