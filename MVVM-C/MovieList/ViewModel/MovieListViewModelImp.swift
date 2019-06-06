//
//  MovieListViewModelImp.swift
//  MVVM-C
//
//  Created by Jakub Perich on 06/06/2019.
//  Copyright © 2019 com.jakubperich. All rights reserved.
//

import Foundation

class MovieListViewModelImp : MovieListViewModel {
    
    var data: [MovieModel]?
    var service: MovieListService
    var title: String{
        return "Star Wars Movies"
    }
    weak var coordinatorDelegate: MovieListViewModelCoordinatorDelegate?
    
    
    var showData: (() -> ())?
    var showLoader: (() -> ())?
    var hideLoader: (() -> ())?
    
    private var shouldShowLoader = false{
        didSet{
            (self.shouldShowLoader) ? self.showLoader?() : self.hideLoader?()
        }
    }
    
    init(service : MovieListService) {
        self.service = service
        shouldShowLoader = true
        self.getData()
    }
    
    func didTapOnMovie(of index: Int) {
        self.coordinatorDelegate?.didTapOnRow(with: self.data![index])
    }
    
    func heightForRow(at index: Int, of section: Int) -> Int {
        return 70
    }
    
    
    func numberOfRowsInSection(section: Int) -> Int {
        return (data != nil) ? (data?.count)! : 0
    }
    func viewDidLoad() {
        (shouldShowLoader) ? self.showLoader?() : self.hideLoader?()
    }
    
    func getMovieName(at index: Int) -> String {
        return self.data![index].name
    }
    
    private func getData(){
        self.service.getMovieList { [weak self](data) in
            guard let `self` = self else { return }
            self.data = data
            self.shouldShowLoader = false
            self.showData?()
        }
    }
}
