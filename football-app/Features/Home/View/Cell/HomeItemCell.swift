//
//  HomeItemCell.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import Foundation
import UIKit

class HomeItemCell: UITableViewCell {
    static let identifier = "HomeItemCell"
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func binding(model: TeamModel) {
        avatar.load(fromUrl: model.imageUrl)
        title.text = model.name
        subtitle.text = model.description
    }
}
