//
//  AboutVC.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import Foundation
import UIKit

class AboutVC: UIViewController {
    var viewModel: AboutViewModel
    @IBOutlet weak var avatar: CircleImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileEmail: UILabel!
    @IBOutlet weak var profileGithub: UILabel!
    
    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: CircleImageView = {
        let imageView = CircleImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = .zero
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var repositoryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = .zero
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(viewModel: AboutViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        containerView.addSubview(contentView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(emailLabel)
        contentView.addSubview(repositoryLabel)
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisapear.accept?(())
    }
}

extension AboutVC {
    private func setupUI() {
        navigationItem.title = "Sobre mim"
        
        /* avatar.load(fromUrl: viewModel.avatar)
        profileName.text = viewModel.name
        profileEmail.text = viewModel.email
        profileGithub.text = viewModel.github */
        
        imageView.load(fromUrl: viewModel.avatar)
        nameLabel.text = viewModel.name
        emailLabel.text = viewModel.email
        repositoryLabel.text = viewModel.github
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            containerView.heightAnchor.constraint(equalToConstant: 230)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            contentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            contentView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            repositoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            repositoryLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5)
        ])
    }
}
