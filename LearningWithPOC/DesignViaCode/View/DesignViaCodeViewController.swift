//
//  DesignViaCodeViewController.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 04/05/22.
//

import UIKit

class DesignViaCodeViewController: UIViewController {

    private var  loginView: LoginView = {
       let view = LoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: Designing the View
extension DesignViaCodeViewController {
    private func configureView(){
        view.addSubview(loginView)
        loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        loginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
