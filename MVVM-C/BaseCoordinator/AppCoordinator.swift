//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by Jakub Perich on 06/06/2019.
//  Copyright © 2019 com.jakubperich. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()->UIViewController
}

final class AppCoordinator : Coordinator{
    
    private var window : UIWindow?
    
    lazy var dataStore : DataStore = {
        return DataStoreImp()
    }()
    
    init(window : UIWindow) {
        self.window = window
    }
    var listCoordinator : MovieListCoordinator!
    
    @discardableResult
    func start()->UIViewController{
        listCoordinator = MovieListCoordinator(dataStore: dataStore)
        let mainVC = listCoordinator.start()
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
        return mainVC
    }
}
