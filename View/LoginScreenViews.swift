//
//  LoginScreenViews.swift
//  NavigTest
//
//  Created by Mac on 20.01.2023.
//

import Foundation
import UIKit


var logo: UIImageView = {
    let log = UIImageView()
    log.backgroundColor = .white
    log.image = UIImage(named: "logo")
    log.translatesAutoresizingMaskIntoConstraints = false
   return log
}()

 var email: UITextField = {
    let em = UITextField()
    em.layer.borderWidth = 0.5
    em.layer.borderColor = UIColor.lightGray.cgColor
    em.placeholder = "Введите e-mail"
    em.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    em.backgroundColor = .systemGray6
    em.font = UIFont.systemFont(ofSize: 15)
    em.translatesAutoresizingMaskIntoConstraints = false
    em.clipsToBounds = true
    em.layer.cornerRadius = 10
    em.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    em.keyboardType = UIKeyboardType.default
    em.clearButtonMode = UITextField.ViewMode.whileEditing
    em.returnKeyType = UIReturnKeyType.done
    em.resignFirstResponder()
    return em
}()

var password: UITextField = {
    let pass = UITextField()
    pass.layer.borderWidth = 0.5
    pass.layer.borderColor = UIColor.lightGray.cgColor
    pass.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    pass.placeholder = "Придумайте пароль"
    pass.font = UIFont.systemFont(ofSize: 15)
    pass.backgroundColor = .systemGray6
    pass.keyboardType = UIKeyboardType.default
    pass.translatesAutoresizingMaskIntoConstraints = false
    pass.clipsToBounds = true
    pass.layer.cornerRadius = 10
    pass.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
   // password.isSecureTextEntry = true
    return pass
}()

 var registrationTxt: UILabel = {
    let txt = UILabel()
    txt.textColor = .black
    txt.textAlignment = .center
    txt.font = UIFont.boldSystemFont(ofSize: 20)
    txt.text = "Регистрация"
    txt.translatesAutoresizingMaskIntoConstraints = false
 return txt
}()

 var alredRegisteredTxt: UILabel = {
    let txt = UILabel()
    txt.textColor = .black
    txt.textAlignment = .center
    txt.font = UIFont.systemFont(ofSize: 12)
    txt.text = "Уже зарегистрированы?"
    txt.translatesAutoresizingMaskIntoConstraints = false
    return txt
}()


