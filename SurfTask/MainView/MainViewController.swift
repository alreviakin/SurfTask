//
//  MainViewController.swift
//  SurfTask
//
//  Created by Алексей Ревякин on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureation()
    }
    
    private func configureation() {
        view.backgroundColor = UIColor(hexString: "#F3F3F5")
        title = "Профиль"
    }

}
