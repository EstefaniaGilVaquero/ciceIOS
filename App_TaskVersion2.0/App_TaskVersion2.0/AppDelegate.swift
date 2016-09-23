//
//  AppDelegate.swift
//  App_TaskVersion2.0
//
//  Created by formador on 20/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //TODO: - Aqui customizo el texto de la NavigationBar
        configuracionNavigationBar()
        
        //TODO: - NOTIFICACION PUSH LOCAL
        if(UIApplication.instancesRespondToSelector(#selector(UIApplication.registerUserNotificationSettings(_:)))){
            let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
            UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        }
        
        
       
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
    //MARK: - UTILS
    func configuracionNavigationBar(){
        
        //TODO: - Aqui personalizo la NavigationBar
        let navigationBarAppearance = UINavigationBar.appearance()
        let colorNB = UIColor(red: 0.08, green: 0.08, blue: 0.08, alpha: 1)
        
        navigationBarAppearance.tintColor = UIColor.whiteColor()
        navigationBarAppearance.barTintColor = colorNB
        
        //TODO: - Aqui coloco la status bar en blanco de manera automagica
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        //TODO: - Aqui personalizo el texto de la barra de navegacion
        let shadow = NSShadow()
        shadow.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
        shadow.shadowOffset = CGSizeMake(0.0, 1.5)
        
        navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSShadowAttributeName: shadow]
        

        
    }


}










