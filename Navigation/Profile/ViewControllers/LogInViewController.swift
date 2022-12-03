//
//  LogInViewController.swift
//  Navigation
//
//  Created by Никита Бурин on 14.10.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let minPassSymbol = 8
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: view.frame.size.width, height: 1000)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let logoVk: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleToFill
        return logo
    }()
    
    let stackForLoginPassword: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 0
        stack.clipsToBounds = true
        return stack
    }()
    
    lazy var loginField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .systemGray6
        field.layer.borderWidth = 0.5
        field.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        field.placeholder = "Login"
        field.autocapitalizationType = .none
        field.textColor = .black
        field.leftViewMode = UITextField.ViewMode.always
        field.leftView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        field.layer.cornerRadius = 10
        field.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        field.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        return field
    }()
    
    lazy var passwordField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .systemGray6
        field.layer.borderWidth = 0.5
        field.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        field.placeholder = "Password"
        field.autocapitalizationType = .none
        field.textColor = .black
        field.isSecureTextEntry = true
        field.leftViewMode = UITextField.ViewMode.always
        field.leftView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        field.layer.cornerRadius = 10
        field.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        field.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        return field
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonLogin), for: .touchUpInside)
        button.setTitleColor(.init(white: 0, alpha: 0.8), for: .highlighted)
        button.setTitleColor(.init(white: 0, alpha: 0.8), for: .disabled)
        button.setTitleColor(.init(white: 0, alpha: 0.8), for: .selected)
        return button
    }()
    
    lazy var alertLabelForPassword: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Минимальная длина пароля \(minPassSymbol) символа(-ов)"
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
    lazy var alertC: UIAlertController = {
        let alert = UIAlertController(title: "Ошибка", message: "Проверьте правильность введенных данных", preferredStyle: .alert)
        alert.addAction(alertActionOk)
        return alert
    }()
    
    let alertActionOk = UIAlertAction(title: "Ok", style: .cancel)
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "LogIn"
        tabBarItem = UITabBarItem(title: "LogIn", image: UIImage(systemName: "square.and.arrow.up"), tag: 2)
        navigationController?.navigationBar.isHidden = true
        
        settingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func settingView(){
        view.addSubview(scrollView)
        
        scrollView.addSubview(logoVk)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(loginField)
        scrollView.addSubview(alertLabelForPassword)
        scrollView.addSubview(stackForLoginPassword)
        stackForLoginPassword.addArrangedSubview(loginField)
        stackForLoginPassword.addArrangedSubview(passwordField)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: view.frame.size.height),
            scrollView.widthAnchor.constraint(equalToConstant: 1000),
            
            logoVk.heightAnchor.constraint(equalToConstant: 100),
            logoVk.widthAnchor.constraint(equalToConstant: 100),
            logoVk.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoVk.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            
            stackForLoginPassword.heightAnchor.constraint(equalToConstant: 100),
            stackForLoginPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            stackForLoginPassword.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            stackForLoginPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackForLoginPassword.topAnchor.constraint(equalTo: logoVk.bottomAnchor, constant: 120),
            
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            loginButton.topAnchor.constraint(equalTo: stackForLoginPassword.bottomAnchor, constant: 16),
            
            alertLabelForPassword.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 12),
            alertLabelForPassword.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
        ])
    }
    
    @objc func buttonLogin() {
        
        if let login = loginField.text, login.isEmpty {
            loginField.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
            passwordField.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
            stackForLoginPassword.shake()
        } else {
            loginField.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
            passwordField.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
            if let textPass = passwordField.text {
                 if textPass.count < minPassSymbol && textPass.count >= 0 {
                     alertLabelForPassword.isHidden = false
                 } else {
                     alertLabelForPassword.isHidden = true
                     if loginPass.login == loginField.text && loginPass.password == passwordField.text {
                         let profileVC = ProfileViewController()
                         profileVC.tabBarController?.tabBar.isHidden = false
                         profileVC.navigationItem.setHidesBackButton(false, animated: false)
                         self.navigationController?.pushViewController(profileVC, animated: true)
                     } else {
                         self.present(alertC, animated: true)
                     }
                 }
            }
        }
    }
    
    func subscribeKeyboardEvents(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:
            UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification){
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height + 60, right: 0)
    }
    
    @objc func textChanged(_ textField: UITextField){
        guard textField.text != "" else {return}
        textField.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
}





