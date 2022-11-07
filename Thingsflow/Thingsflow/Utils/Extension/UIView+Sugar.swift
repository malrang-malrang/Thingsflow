//
//  UIView+Sugar.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
}
