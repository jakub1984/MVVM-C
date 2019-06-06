//
//  MovieModel.swift
//  MVVM-C
//
//  Created by Jakub Perich on 06/06/2019.
//  Copyright © 2019 com.jakubperich. All rights reserved.
//

import Foundation

struct MovieModel {
    var name : String
    var image : String
    var description : String
}

protocol DataStore {
    func getAllMovie()->[MovieModel]
    func getMovie(by id : Int)->MovieModel?
}

protocol MovieListService {
    var dataStore : DataStore { get }
    
    func getMovieList(response : @escaping([MovieModel])->())
    func getMovie(by id : Int, response : @escaping(MovieModel?)->())
}

protocol MovieListViewModelCoordinatorDelegate : class{
    func didTapOnRow(with data : MovieModel)
}


protocol MovieListViewModel : class{
    
    var data : [MovieModel]?{ get }
    var service : MovieListService{ get }
    var coordinatorDelegate : MovieListViewModelCoordinatorDelegate?{get set}
    var title : String{ get }
    
    var showData : (()->())?{ get set}
    var showLoader : (()->())?{get set}
    var hideLoader : (()->())?{get set}
    
    func didTapOnMovie(of index : Int)
    func heightForRow(at index : Int, of section : Int)->Int
    func numberOfRowsInSection(section : Int)->Int
    func viewDidLoad()
    func getMovieName(at index : Int)->String
}

protocol MovieDetailViewModel {
    var data : MovieModel{ get }
    var title : String{ get }
    
    var showData : ((MovieModel)->())?{ get set }
    
    func viewDidLoad()
}

