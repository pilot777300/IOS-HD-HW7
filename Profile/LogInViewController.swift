//
//  LogInViewController.swift
//  NavigTest
//
//  Created by Mac on 15.08.2022.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {
    
    var signUp: Bool = true {
        willSet {
            if newValue {
                registrationTxt.text = "Регистрация"
            } else {
                registrationTxt.text = "Вход"
                email.placeholder = "Введите корректный e-mail"
                password.placeholder = "Введите пароль"
            }
        }
    }
     
    private lazy var loginButton: CustomButton = {
        let button = CustomButton(buttonTitle: "Войти" , buttonColor: .white) { [self] in
            loginButtonPressed()
        }
       return button
    }()
 
    var loginDelegate: LoginViewControllerDelegate = LoginInspector()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self
        password.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
       
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white

        self.view.addSubview(logo)
        self.view.addSubview(email)
        self.view.addSubview(password)
        self.view.addSubview(loginButton)
        self.view.addSubview(registrationTxt)
        self.view.addSubview(alredRegisteredTxt)
        constraints()
            }
   
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -90 
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
    }
   
   @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
   
     func loginButtonPressed() {
         signUp = !signUp
         alredRegisteredTxt.isHidden = true
         loginButton.setTitle("Зарегистрироваться", for: .normal)
                }
    
    private func constraints() {
        let safeArea = view.safeAreaLayoutGuide
     NSLayoutConstraint.activate([
        logo.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
       logo.widthAnchor.constraint(equalToConstant: 100),
       logo.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 120.0),
       logo.heightAnchor.constraint(equalToConstant: 100),
        
        registrationTxt.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
        registrationTxt.bottomAnchor.constraint(equalTo: logo.bottomAnchor, constant: 100),
        registrationTxt.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        registrationTxt.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        registrationTxt.heightAnchor.constraint(equalToConstant: 50),
        
        email.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
        email.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
        email.heightAnchor.constraint(equalToConstant: 50),
        email.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        email.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
      
        password.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
        password.topAnchor.constraint(equalTo: email.bottomAnchor),
        password.heightAnchor.constraint(equalToConstant: 50),
        password.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        password.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),

        alredRegisteredTxt.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
        alredRegisteredTxt.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10),
        alredRegisteredTxt.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        alredRegisteredTxt.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        
        loginButton.topAnchor.constraint(equalTo: alredRegisteredTxt.bottomAnchor, constant: 5),
        loginButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        loginButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func showAlert() {
        let alert = UIAlertController(title: nil, message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        }
    }

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let email = email.text!
        let password = password.text!
        if signUp { // если нажата "Регистрация"
            if (!email.isEmpty && !password.isEmpty) { // если поля не пустые
                Auth.auth().createUser(withEmail: email, password: password) { result, error in //создаем нового юзера
                    if error == nil {
                        if let result = result {
                            print(result.user.uid)
                            let ref = Database.database(url: "https://authorization-ef0cc-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("users")
                            ref.child(result.user.uid).updateChildValues(["email":email]) // добавляем емейл юзера в базу
                        let profileViewController = ProfileViewController()  // и переходим на ProfieViewController
                            self.navigationController?.pushViewController(profileViewController, animated: true)
                            self.showAlertSuccessRegistered()
                        }
                    }
                }
            } else {
                showAlert()
            }
        } else { // если нажата "Вход"
                if  (!email.isEmpty && !password.isEmpty) { // и все поля заполнены

                    Auth.auth().signIn(withEmail: email, password: password) { success, error in // проверяем зарегистрирован ли пользователь
                        
                        if (success != nil) { // если зарегистрирован

                                let profileViewController = ProfileViewController() // переходим на контоллер
                                   self.navigationController?.pushViewController(profileViewController, animated: true)

                        } else {
                            self.showAlertNotRegisteredUser() // если нет, то показываем алерт 
                        }
                    }
                } else {
                    showAlert()
                }
            }
        return true
    }
    
    func showAlertNotRegisteredUser () {
        let alert = UIAlertController(title: "Пользователь не найден", message: "Проверьте правильность введенных данных", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertSuccessRegistered() {
        let alert = UIAlertController(title: nil, message: "Вы успешно зарегистрированы", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}


