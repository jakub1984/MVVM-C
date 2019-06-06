//
//  Protocols.swift
//  MVVM-C
//
//  Created by Jakub Perich on 06/06/2019.
//  Copyright © 2019 com.jakubperich. All rights reserved.
//

import Foundation
import UIKit

/**
 For initializeing story board and instantiaing ViewController .
 
 - storyboardIdentifier : Should be same as class name
 - storyboardName : storyboard enum
 - instantiateViewController : for instantiating viewcontroller
 */
protocol StoryboardInitializable {
    static var storyboardIdentifier: String { get }
    static var storyboardName: UIStoryboard.Storyboard { get }
    static func instantiateViewController() -> UIViewController
}
