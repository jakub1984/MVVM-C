//
//  MovieDetailViewModelImp.swift
//  MVVM-C
//
//  Created by Jakub Perich on 06/06/2019.
//  Copyright © 2019 com.jakubperich. All rights reserved.
//

import Foundation

class MovieDetailViewModelImp : MovieDetailViewModel{
    var data: MovieModel
    var title: String{
        return data.name
    }
    
    var showData: ((MovieModel) -> ())?
    
    init(data : MovieModel) {
        self.data = data
    }
    
    func viewDidLoad() {
        self.showData?(self.data)
    }
}
