//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 최지혁 on 2022/07/03.
//

import Foundation
import UIKit

class EnterEmailViewController:UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 30
        
        nextButton.isEnabled = false
        
        emailTextField.delegate = self
        passwordTextFeild.delegate = self
        
        emailTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Navi Bar 보이기
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationItem.titleView?.tintColor = UIColor.white
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
    }
    
}

extension EnterEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextFeild.text == ""
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
