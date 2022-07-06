//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 최지혁 on 2022/07/03.
//

import Foundation
import UIKit
import FirebaseAuth

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
        //Navi Bar title color 변경
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        //Firebase 이메일/비밀번호 인증
        let email = emailTextField.text ?? ""
        let password = passwordTextFeild.text ?? ""
        
        //신규사용자 생성
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error {
                let code = (error as NSError).code
                switch code {
                case 170077: //이미 가입한 계정일 때
                    self.loginUser(withEmail: email, password: password)
                    //로그인하기
                default:
                    self.errorMessageLabel.text = error.localizedDescription
                }
            } else {
                self.showMainViewController()
            }
            
        }
    }
    
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
    
    private func loginUser(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] _, error in
            guard let self = self else { return }
            
            if let error = error {
                self.errorMessageLabel.text = error.localizedDescription
            } else {
                self.showMainViewController()
            }
        }
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
