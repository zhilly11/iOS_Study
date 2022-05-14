//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 최지혁 on 2022/03/22.
//

import UIKit

class CodePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String?
    
    // 여기로 값이 전달 된다.
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit() // 값 출력이 짤릴때 사용
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapBackBotton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
