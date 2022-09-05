//
//  CircleImageView.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import Foundation
import UIKit

class CircleImageView: UIImageView {
    override func layoutSubviews() {
        layer.masksToBounds = false
        layer.cornerRadius = frame.size.height / 2
        clipsToBounds = true
    }
}
