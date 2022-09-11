//
//  DetailCoordinator.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import Foundation

class DetailCoordinator: BaseCoordinator {
    private var data: TeamModel?
    private var viewModel = TeamDetailViewModel()
    
    init(data: TeamModel) {
        self.data = data
    }
    
    override func start() {
        setupBinding()
        
        let detail = TeamDetailVC(viewModel: viewModel)
        detail.viewModel = viewModel
        detail.data = data
        navigationController.present(detail, animated: true)
    }
    
    private func setupBinding() {
        viewModel.viewDidDisappear.subscribe(to: self) { this, _ in
            this.parentCoordinator?.didFinish(coordinator: this)
        }
    }
}
