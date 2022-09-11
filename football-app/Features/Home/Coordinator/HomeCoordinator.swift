//
//  HomeCoordinator.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import Foundation
import UIKit

class HomeCoordinator: BaseCoordinator {
    private var viewModel: HomeViewModel = HomeViewModel(repository: DataRepository())
    
    override func start() {
        setupData()
        setupBinding()

        let homeVC = HomeVC(viewModel: viewModel)
        homeVC.viewModel = viewModel
        self.navigationController = UINavigationController(rootViewController: homeVC)
        self.navigationController.viewControllers = [homeVC]
    }
    
    private func setupData() {
        let repository = DataRepository()
        viewModel = HomeViewModel(repository: repository)
    }
    
    private func setupBinding() {
        viewModel.homeItemSelected.subscribe(to: self) { this, data in
            this.navigateToDetail(data: data)
        }
        
        viewModel.aboutSelected.subscribe(to: self) { this, _ in
            this.navigateToAbout()
        }
        
        viewModel.viewDidDisappear.subscribe(to: self) { this, _ in
            this.parentCoordinator?.didFinish(coordinator: this)
        }
    }
    
    private func navigateToDetail(data: TeamModel) {
        let detail = DetailCoordinator(data: data)
        detail.navigationController = navigationController
        start(coordinator: detail)
    }
    
    private func navigateToAbout() {
        let about = AboutCoordinator()
        about.navigationController = navigationController
        start(coordinator: about)
    }
}
