//
//  AppDelegate.swift
//  InteractiveNotifications
//
//  Created by xzysun on 14-10-9.
//  Copyright (c) 2014年 AnyApps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.registerForNotification()
        if launchOptions != nil {
            NSLog("LaunchOptions:%@", launchOptions!)
        }
        application.applicationIconBadgeNumber = 0
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        NSLog("Will Enter Background!")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        NSLog("Will Enter Foreground!")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    let NotificationCategoryIdent:String = "ACTION_INTERACTIVE"
    let NotificationActionOneIdent:String = "ACTION_ONE"
    let NotificationActionTwoIdent:String = "ACTION_TWO"
    let NotificationActionThreeIdent:String = "ACTION_THREE"
    let NotificationActionFourIdent:String = "ACTION_FOUR"
    
    func registerForNotification() {
        NSLog("Register Notification")
        var action1:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        action1.activationMode = UIUserNotificationActivationMode.Background
        action1.title = "Action 1"
        action1.identifier = NotificationActionOneIdent
        action1.destructive = false
        action1.authenticationRequired = false
        
        var action2:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        action2.activationMode = UIUserNotificationActivationMode.Background
        action2.title = "Action 2"
        action2.identifier = NotificationActionTwoIdent
        action2.destructive = false
        action2.authenticationRequired = false
        
        var action3:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        action3.activationMode = UIUserNotificationActivationMode.Background
        action3.title = "Destructive"
        action3.identifier = NotificationActionThreeIdent
        action3.destructive = true
        action3.authenticationRequired = false
        
        var action4:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        action4.activationMode = UIUserNotificationActivationMode.Foreground
        action4.title = "打开"
        action4.identifier = NotificationActionFourIdent
        action4.destructive = false
        action4.authenticationRequired = false
        
        var actionCategory:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        actionCategory.identifier = NotificationCategoryIdent
        actionCategory.setActions(NSArray(objects: action3, action4, action1, action2), forContext: UIUserNotificationActionContext.Default)
        
        var settings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: (UIUserNotificationType.Alert|UIUserNotificationType.Sound|UIUserNotificationType.Badge), categories: NSSet(object: actionCategory))
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        if(identifier == NotificationActionOneIdent) {
            NSLog("Choose Action 1")
        } else if(identifier == NotificationActionTwoIdent) {
            NSLog("Choose Action 2")
        } else if(identifier == NotificationActionThreeIdent) {
            NSLog("Choose Action Destructive")
        } else if(identifier == NotificationActionFourIdent) {
            NSLog("Choose Action Open")
        }
//        if (completionHandler) {
            completionHandler()
//        }
    }

    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        NSLog("Did receiveLocalNotification:%@", notification)
    }
}

