//  AppDelegate.swift
//  TestAppCocoaPods02

import UIKit
import CoreData
import SugarRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        //let stack: DefaultCDStack = DefaultCDStack(databaseName: "TestAppCocoaPods02.sqlite", automigrating: true)
        //let stack: DefaultCDStack = DefaultCDStack(databaseName: "TestAppCocoaPods02SugarRecord.sqlite", automigrating: true)
        let stack: DefaultCDStack = DefaultCDStack(databaseName: "TestAppCocoaPods02SugarRecord2.sqlite", automigrating: true)
        SugarRecord.addStack(stack)
        
        SugarRecordLogger.currentLevel = .logLevelError

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        SugarRecord.applicationWillResignActive()
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
        SugarRecord.applicationWillEnterForeground()
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
        SugarRecord.applicationWillTerminate()

    }
}

