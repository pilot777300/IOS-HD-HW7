//
//  CustomButton.swift
//  NavigTest
//
//  Created by Mac on 04.11.2022.
//

import UIKit

class CustomButton: UIButton {
 
    var buttonTitle: String
    var buttonColor: UIColor
    var titleColor: UIColor
    typealias Action = () -> Void
    var buttonAction: Action
    
    init(buttonTitle: String, buttonColor: UIColor, titleColor: UIColor = .systemBlue, action: @escaping Action) {
        buttonAction = action
        self.buttonTitle = buttonTitle
        self.buttonColor = buttonColor
        self.titleColor = titleColor
        super.init(frame: .zero)
        clipsToBounds = true
        backgroundColor = buttonColor
        setTitleColor(titleColor, for: .normal)
      //  layer.cornerRadius = 10
        setTitle(buttonTitle, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 13)
        layer.masksToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc private func buttonTapped() {
            buttonAction()
        }
    
//    var action: (UIButton) -> Void = { (button: UIButton) -> Void in
//        let btn =  button
//        if #available(iOS 14.0, *) {
//            btn.addAction(UIAction(title: "Click Me", handler: { _ in
//                let profileViewController: ProfileViewController = ProfileViewController()
//                let l: LogInViewController = LogInViewController()
//                if  l.loginDelegate.check(login: l.email.text!, password: l.password.text!) == true
//                                                 {
//                    l.navigationController?.pushViewController(profileViewController, animated: true)
//                           } else {
//                               let alert = UIAlertController(title: "Ошибка",
//                                                           message: "Неправильный логин или пароль",
//                                                           preferredStyle: .alert)
//                                                   alert.addAction(UIAlertAction(title: "Попробую снова", style: .cancel, handler: nil))
//                                                       l.present(alert, animated: true)
//                                    }
//                                        }), for: .touchUpInside)
//        } else {
//            print("Ваш телефон слишком старый")
//            }
//        }
    
//
//    required init (buttonTitle: String = "", buttonColor: UIColor, titleColor: UIColor) {
//
//           self.buttonTitle = buttonTitle
//           self.buttonColor = buttonColor
//           self.titleColor = titleColor
//        super.init(frame: .zero)
//
//       }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//        }
    }
