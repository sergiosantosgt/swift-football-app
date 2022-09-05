//
//  DataRepository.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import Foundation

class DataRepository {
    func fetchTeams() -> [TeamModel] {
        let data = JsonUtils().getJson(filename: "dummy", model: [TeamModel].self)
        return data ?? []
    }
}
