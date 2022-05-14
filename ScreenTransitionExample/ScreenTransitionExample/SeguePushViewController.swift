//
//  SeguePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 최지혁 on 2022/03/22.
//

import UIKit

class SeguePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        // rootViewController로 이동하는 법
        //self.navigationController?.popToRootViewController(animated: true)
    }
}
