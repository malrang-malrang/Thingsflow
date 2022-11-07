//
//  UIStackView+Sugar.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ view: UIView...) {
        view.forEach {
            self.addArrangedSubview($0)
        }
    }
}
