//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 최지혁 on 2022/07/03.
//

import Foundation
import UIKit
import GoogleSignIn
import Firebase


class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FirebaseApp.configure()
        
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Navi Bar 숨기기
        navigationController?.navigationBar.isHidden = true
    }
    
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
        //UIApplication.shared.windows.first?.rootViewController?.show(mainViewController, sender: nil)
        //UIWindowScene.windows.first?.rootViewController?.show(mainViewController, sender: nil)
    }
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        //Firebase 인증
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            if let error = error {
                print("ERROR", error.localizedDescription)
                return
            }
            
            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken else { return }
            
            // Google Access Token 부여 받기
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { _, _ in
                self.showMainViewController()
            }
        }
    }

    @IBAction func appleLoginButtonTapped(_ sender: Any) {
        //Firebase 인증
    }
}
