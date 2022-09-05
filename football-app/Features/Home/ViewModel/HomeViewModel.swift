//
//  HomeViewModel.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import Foundation

class HomeViewModel {
    private var repo: DataRepository!
    
    let viewDidDisappear = DelegateView<Void>()
    let homeItemSelected = DelegateView<TeamModel>()
    let aboutSelected = DelegateView<Void>()
    
    init(repository: DataRepository) {
        self.repo = repository
    }
    
    func fetctTeam() -> [TeamModel] {
        return repo.fetchTeams()
    }
}
