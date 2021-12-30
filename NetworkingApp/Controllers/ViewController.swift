//
//  ViewController.swift
//  NetworkingApp
//
//  Created by Sergey Efimov on 27.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userInfoLabel: UILabel!
    
    private var user: User?
    
    @IBAction func getButtonPressed() {
        NetworkManager.shared.fetchData(Link.url) { result in
            switch result {
            case .success(let user):
                self.user = user
                self.userInfoLabel.text = user.description
            case .failure(let error):
                print(error)
            }
        }
       
    }
}

