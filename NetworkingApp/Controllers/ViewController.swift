//
//  ViewController.swift
//  NetworkingApp
//
//  Created by Sergey Efimov on 27.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userInfoLabel: UILabel!
    
    override func viewDidLoad() {
        fetch(from: Link.url)
        print(Link.url)
    }
    
    private var user: User?
    
    @IBAction func getButtonPressed() {
        userInfoLabel.text = user?.description
    }
    
    
    func fetch(from url: String) {
        NetworkManager.shared.fetchApi(from: url) { user in
            self.user = user
        }
    }

}

