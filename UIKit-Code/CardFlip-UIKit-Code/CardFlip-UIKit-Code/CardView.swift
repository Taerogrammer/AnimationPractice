//
//  CardView.swift
//  CardFlip-UIKit-Code
//
//  Created by 김태형 on 2023/10/30.
//

import Foundation
import UIKit

class CardView: UIView {
    private var isFlipped = false
    private let contentView = UIView()  // 앞면, 뒷면을 담을 뷰
    private let frontView = UIView() // 앞면 뷰
    private let backView = UIView() // 뒷면 뷰

    private let frontLabel = UILabel() // 앞면 뷰에 텍스트 레이블
    private let backLabel = UILabel() // 뒷면 뷰에 텍스트 레이블

    init() {
        super.init(frame: .zero)

        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor

        // 앞면 뷰
        frontView.backgroundColor = .white
        frontLabel.text = "앞면 뷰 입니다"
        frontLabel.textAlignment = .center
        frontView.addSubview(frontLabel)

        // 뒷면 뷰
        backView.backgroundColor = .systemBlue
        backLabel.text = "뒷면 뷰 입니다"
        backLabel.textAlignment = .center
        backLabel.textColor = .white
        backView.addSubview(backLabel)

        backView.isHidden = true

        addSubview(contentView)
        contentView.addSubview(frontView)
        contentView.addSubview(backView)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flip))  // flip 메서드 만들기
        addGestureRecognizer(tapGesture)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = bounds
        frontView.frame = bounds
        backView.frame = bounds
        frontLabel.frame = frontView.bounds
        backLabel.frame = backView.bounds
    }

    @objc func flip() {
        isFlipped.toggle()

        let transitionOptions: UIView.AnimationOptions = isFlipped ? .transitionFlipFromLeft : .transitionFlipFromRight

        UIView.transition(with: contentView, duration: 0.5, options: transitionOptions, animations: {
            self.frontView.isHidden = self.isFlipped
            self.backView.isHidden = !self.isFlipped
        }, completion: nil)
    }
}
