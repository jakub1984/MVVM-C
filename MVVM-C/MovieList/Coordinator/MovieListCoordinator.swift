//
//  MovieListCoordinator.swift
//  MVVM-C
//
//  Created by Jakub Perich on 06/06/2019.
//  Copyright © 2019 com.jakubperich. All rights reserved.
//

import Foundation
import UIKit

class MovieListCoordinator: Coordinator {
    
    var rootViewController: UINavigationController!
    var dataStore : DataStore
    var detailViewCoordinator : MovieDetailViewCoordinator!
    
    init( dataStore : DataStore) {
        self.dataStore = dataStore
    }
    
    func start()->UIViewController{
        
        let listVC = MovieListCoordinator.instantiateViewController() as! MovieListViewController
        rootViewController = UINavigationController(rootViewController: listVC)
        let service = MovieListServiceImp(dataStore: self.dataStore)
        let viewModel = MovieListViewModelImp(service: service)
        viewModel.coordinatorDelegate = self
        listVC.viewModel = viewModel
        return rootViewController
    }
}

extension MovieListCoordinator : MovieListViewModelCoordinatorDelegate{
    func didTapOnRow(with data: MovieModel) {
        detailViewCoordinator = MovieDetailViewCoordinator(navigationController: self.rootViewController, data: data)
        let detailVC = detailViewCoordinator.start()
        self.rootViewController.pushViewController(detailVC, animated: true)
    }
}

extension MovieListCoordinator : StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}

