//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 최지혁 on 2022/03/22.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    weak var delegate: SendDataDelegate? // delegate 변수를 선언할때는 메모리 누수가 발생 할 수 있으므로 weak를 꼭 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = name {
            self.nameLabel.text = name
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapBackBotton(_ sender: UIButton) {
        self.delegate?.sendData(name: "zhilly")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

}
