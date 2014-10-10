//
//  ViewController.swift
//  InteractiveNotifications
//
//  Created by xzysun on 14-10-9.
//  Copyright (c) 2014年 AnyApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sendNotificationButtonAction(sender: AnyObject) {
        NSLog("Click Send Button")
        self.sendNotification()
    }
    
    
    func sendNotification() {
        var notification:UILocalNotification = UILocalNotification()
        notification.alertBody = "Pull down to interact."
        notification.category = "ACTION_INTERACTIVE"
        notification.fireDate = NSDate(timeIntervalSinceNow: 10)
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.applicationIconBadgeNumber = 1
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
}

