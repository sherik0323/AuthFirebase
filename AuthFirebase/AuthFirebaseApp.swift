//
//  AuthFirebaseApp.swift
//  AuthFirebase
//
//  Created by Sherozbek on 09/12/23.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct AuthFirebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var appViewModel = AppViewModel()
    init(){
        if UserDefaults.standard.bool(forKey: "isLogin"){
            appViewModel.isLogin = true
        } 
         
    }
    var body: some Scene {
        WindowGroup {
            if appViewModel.isLogin {
                AppView()
                    .environmentObject(appViewModel)
            } else {
                ContentView()
                    .environmentObject(appViewModel)
            }
        }
    }
}
