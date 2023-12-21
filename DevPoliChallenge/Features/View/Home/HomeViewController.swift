//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    let homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()        
        homeView.delegate = self
        homeViewModel.delegate = self
    }
    
    override func loadView() {
        self.view = homeView
    }

}

extension HomeViewController: HomeViewDelegate {
    func verifyData(name: String) {
        homeViewModel.verifyNameOfUser(name: name)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func goNextView() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

