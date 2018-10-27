//
//  AppDelegate.swift
//  Todoey
//
//  Created by Ernesto-iMac-27 on 06.10.18.
//  Copyright © 2018 EH iMac 27. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
       // print(Realm.Configuration.defaultConfiguration.fileURL)
        

        do {
            _ = try Realm()
     
        } catch {
            print("Error initialising new realm, \(error)")
        }
        
        
        
        return true
    }

  


}

