//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 최지혁 on 2022/07/06.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    
    @IBOutlet weak var welcomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 숨기기
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 네비 바 숨기기
        navigationController?.navigationBar.isHidden = true
        
        //로그인한 사용자의 이메일 가져오기
        let email = Auth.auth().currentUser?.email ?? "고객"
        
        welcomLabel.text = """
        환영합니다.
        \(email)님
        """
    }
    
    /// 로그아웃 버튼
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        //RootViewController 로 이동
        self.navigationController?.popToRootViewController(animated: true)
    }
}
