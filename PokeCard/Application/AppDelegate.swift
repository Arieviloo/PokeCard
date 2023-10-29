//
//  AppDelegate.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
		window?.makeKeyAndVisible()
		window?.overrideUserInterfaceStyle = .light
		
		return true
	}


}

