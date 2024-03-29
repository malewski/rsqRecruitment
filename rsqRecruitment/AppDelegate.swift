//
//  AppDelegate.swift
//  rsqRecruitment
//
//  Created by Jan Malewski on 01/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        let homeViewController = PatientViewController()
        homeViewController.presenter = PatientPresenter(view: homeViewController, service: PatientService())
        let navigationController = UINavigationController(rootViewController: homeViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }


}

