//
//  MovieListServiceImp.swift
//  MVVM-C
//
//  Created by Jakub Perich on 06/06/2019.
//  Copyright © 2019 com.jakubperich. All rights reserved.
//

import Foundation
class MovieListServiceImp : MovieListService {
    
    var dataStore: DataStore
    
    init(dataStore : DataStore) {
        self.dataStore = dataStore
    }
    func getMovieList(response: @escaping ([MovieModel]) -> ()) {
        let data = dataStore.getAllMovie()
        response(data)
    }
    
    func getMovie(by id: Int, response: @escaping (MovieModel?) -> ()) {
        let data = dataStore.getMovie(by: id)
        response(data)
    }
    
}
