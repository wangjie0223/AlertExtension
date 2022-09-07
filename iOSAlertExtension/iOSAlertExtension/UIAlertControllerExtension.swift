//
//  UIAlertControllerExtension.swift
//  YXWheelView
//
//  Created by jqrios on 2022/9/5.
//

import UIKit

extension UIAlertController {
    
    /// Alert Message 左对齐 行间距不可调,普通类型
    ///
    /// 参数是 `String?` 类型的,不必解包
    ///
    ///     let alertC = UIAlertController.init(title: "标题", message: msg, preferredStyle: .alert)
    ///     let actionC = UIAlertAction.init(title: "确定", style: .default) { a in }
    ///     alertC.alertMessageTextAlignmentLeft(msg)
    ///     alertC.addAction(actionC)
    ///     present(alertC, animated: true, completion: nil)
    ///
    /// - Parameter text: Message
    func alertMessageTextAlignmentLeft(_ text: String?) {
        guard let resLabel = self.view.value(forKeyPath: "_messageLabel") as? UILabel else { return  }
        resLabel.text = text
        resLabel.textAlignment = .left
    }
    
    func alertTitleTextAlignmentLeft(_ text: String?) {
        guard let resLabel = self.view.value(forKeyPath: "_titleLabel") as? UILabel else { return  }
        resLabel.text = text
        resLabel.textAlignment = .left
    }
    
    
    /// Alert Message 左对齐 行间距可调,NSAttributedString类型
    ///
    /// 参数是 `NSAttributedString?` 类型的,不必解包
    ///
    ///     let alertC = UIAlertController.init(title: "标题", message: msg, preferredStyle: .alert)
    ///     let attributedMsg: NSAttributedString? = paragraphStyle(string: msg, lineSpacing: 10)
    ///     alertC.alertMessageTextAlignmentLeft(attributedMsg)
    ///     let actionC = UIAlertAction.init(title: "确定", style: .default) { a in }
    ///     alertC.alertMessageTextAlignmentLeft(msg)
    ///     alertC.addAction(actionC)
    ///     present(alertC, animated: true, completion: nil)
    ///
    /// - Parameter text: Message
    func alertMessageTextAlignmentLeft(_ attributedText: NSAttributedString?) {
        guard let resLabel = self.view.value(forKeyPath: "_messageLabel") as? UILabel else { return  }
        resLabel.attributedText = attributedText
    }

    
}


func paragraphStyle(string: String, lineSpacing: CGFloat) -> NSMutableAttributedString {
    let paragraphStye = NSMutableParagraphStyle()
    paragraphStye.alignment = .left
    paragraphStye.lineSpacing = lineSpacing
    paragraphStye.lineBreakMode = NSLineBreakMode.byWordWrapping
    let attributedString = NSMutableAttributedString.init(string: string, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStye, ])
    return attributedString
}
