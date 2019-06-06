//
//  ViewController.swift
//  MVVM-C
//
//  Created by Jakub Perich on 06/06/2019.
//  Copyright © 2019 com.jakubperich. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    var viewModel : MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.bindUI()
        self.title = self.viewModel.title
        self.viewModel.viewDidLoad()
    }
    
    private func bindUI(){
        self.viewModel.showData = { [weak self] in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }
        
        self.viewModel.showLoader = { print("Show Loader") }
        self.viewModel.hideLoader = { print("Hide Loader") }
    }
    
}

extension MovieListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.viewModel.getMovieName(at: indexPath.row)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didTapOnMovie(of: indexPath.row)
    }
    
}
