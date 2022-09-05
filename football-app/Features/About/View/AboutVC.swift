//
//  AboutVC.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import Foundation
import UIKit

class AboutVC: UIViewController {
    var viewModel: AboutViewModel!
    @IBOutlet weak var avatar: CircleImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileEmail: UILabel!
    @IBOutlet weak var profileGithub: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisapear.accept?(())
    }
}

extension AboutVC {
    private func setupUI() {
        navigationItem.title = "About Me"
        avatar.load(fromUrl: viewModel.avatar)
        profileName.text = viewModel.name
        profileEmail.text = viewModel.email
        profileGithub.text = viewModel.github
    }
}
