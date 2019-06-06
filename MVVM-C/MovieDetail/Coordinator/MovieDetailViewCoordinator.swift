//
//  MovieDetailViewCoordinator.swift
//  MVVM-C
//
//  Created by Jakub Perich on 06/06/2019.
//  Copyright © 2019 com.jakubperich. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewCoordinator : Coordinator{
    
    let navigationController : UINavigationController
    let data : MovieModel
    
    init(navigationController : UINavigationController, data : MovieModel) {
        self.navigationController = navigationController
        self.data = data
    }
    
    func start()->UIViewController{
        let detailVC = MovieDetailViewCoordinator.instantiateViewController() as! MovieDetailViewController
        let viewModel = MovieDetailViewModelImp(data: self.data)
        detailVC.viewModel = viewModel
        return detailVC
    }
}

extension MovieDetailViewCoordinator : StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}
