//
//  TeamDetailVC.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import Foundation
import UIKit

class TeamDetailVC: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    var viewModel: TeamDetailViewModel
    var data: TeamModel?
    
    init(viewModel: TeamDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear.accept?(())
    }
}

extension TeamDetailVC {
    private func setupUI() {
        if let data = data {
            avatar.load(fromUrl: data.imageUrl)
            name.text = data.name
            desc.text = data.description
        }
    }
}
