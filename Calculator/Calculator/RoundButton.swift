//
//  RoundButton.swift
//  Calculator
//
//  Created by 최지혁 on 2022/03/26.
//

import UIKit

@IBDesignable // 변경된 설정값을 스토리보드에서 실시간으로 확인할 수 있다.
class RoundButton: UIButton {

    //IBInspectable 을 사용하면 스토리 보드에서도 사용할 수 있다.
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
                
            }
        }
    }

}

