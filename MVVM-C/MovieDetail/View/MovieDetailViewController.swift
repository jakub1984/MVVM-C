//
//  MovieDetailViewController.swift
//  MVVM-C
//
//  Created by Jakub Perich on 06/06/2019.
//  Copyright © 2019 com.jakubperich. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UILabel!
    
    var viewModel : MovieDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindUI()
        self.title = self.viewModel.title
        self.viewModel.viewDidLoad()
    }
    
    private func bindUI(){
        self.viewModel.showData = { [weak self] (data) in
            guard let `self` = self else { return }
            self.imageView.image = UIImage(named: data.image)
            self.titleLabel.text = data.name
            self.descriptionTextView.text = data.description
        }
    }
}
