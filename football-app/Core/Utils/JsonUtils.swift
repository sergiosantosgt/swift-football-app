//
//  JsonUtils.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import Foundation

class JsonUtils {
    func getJson<MODEL>(filename: String, model: MODEL.Type) -> MODEL? where MODEL: Codable {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return try JSONDecoder().decode(model, from: data)
            } catch {
                print("Error Parsing")
            }
        }
        return nil
    }
}
