//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 최지혁 on 2022/07/06.
//

import UIKit

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
    }
    
    /// 로그아웃 버튼
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        //RootViewController 로 이동
        self.navigationController?.popToRootViewController(animated: true)
    }
}
