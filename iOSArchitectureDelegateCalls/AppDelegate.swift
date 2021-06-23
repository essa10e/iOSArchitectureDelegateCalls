//
//  AppDelegate.swift
//  iOSArchitectureDelegateCalls
//
//  Created by Essa Aldo on 6/23/21.
//

import UIKit

// enum to store all app states:
enum AppState {
    case notRunning
    case launching
    case initalized
    case active
    case inActive
    case walkingUp
    case background
    case terminating
}

extension AppState: CustomStringConvertible {
    var description: String {
        switch self {
        case .notRunning:   return "Not Running"
        case .launching:    return "Launching"
        case .initalized:   return "Initialized"
        case .active:       return "Active"
        case .inActive:     return "Not Active"
        case .walkingUp:    return "Waking Up"
        case .background:   return "Background"
        case .terminating:  return "Terminating"
        }
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // Mark: Properties:
    
    /// Persiste the current app state
    var state = AppState.notRunning
    
    // state: 1
    // When the user tap the app icon, the application willFinishLaunchingWithOption delegate gets called.
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("\(#function) called.\n\t \(state) -> \(AppState.launching)")
        
        // Persist the launching state.
        state = .launching
        
        return true
    }
    
    // state: 2
    // The app will execute all the required initalization.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("\(#function) called.\n\t \(state) -> \(AppState.initalized)")
        state = .initalized
        
        return true
    }

    // state: 3
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("\(#function) called.\n\t \(state) -> \(AppState.active)")
        state = .active
    }
    
    // state: 4
    // When the app is about to move from active to inactive, this method will be called
    // ApplicationWillResignActive
    func applicationWillResignActive(_ application: UIApplication) {
        print("\(#function) called.\n\t \(state) -> \(AppState.inActive)")
        state = .inActive
    }
    
    
    // state: 5
    //
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("\(#function) called.\n\t \(state) -> \(AppState.background)")
        state = .background
    }
    
    // state: 6
    // the app will enter foreground which is called when waking up the app after being in background.
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("\(#function) called.\n\t \(state) -> \(AppState.walkingUp)")
        state = .walkingUp
    }
    
    // state: 7
    // Terminating.
    func applicationWillTerminate(_ application: UIApplication) {
        print("\(#function) called.\n\t \(state) -> \(AppState.terminating)")
        state = .terminating
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

