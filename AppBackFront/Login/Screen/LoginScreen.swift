//
//  LoginScreen.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 30/06/23.
//

import UIKit
protocol LoginScreenProtocol: AnyObject {
    func tappedLogin()
}
class LoginScreen: UIView {
    private weak var delegate:LoginScreenProtocol?
    
    func delegate(delegate:LoginScreenProtocol?) {
        self.delegate = delegate
    }
    lazy var subImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BGLogin")
        return image
    } ()
    
    lazy var logoImageView:UIImageView = {
        let image:UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BFLogin")
        return image
    }()
    
    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "BF NFT"
        return label
    }()
    
    lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "O marketplace de NTFs da Backfront Academy"
        return label
    }()
    
    lazy var emailTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.white.cgColor
        textField.clipsToBounds = true
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Login",
                                                             attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.40)])
        textField.keyboardType = .emailAddress
        textField.textColor = .white
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.white.cgColor
        textField.clipsToBounds = true
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        textField.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.40)])
        textField.textColor = .white
        return textField
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recuperar Senha?", for: .normal)
        button.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tappedRecoverPasswordButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRecoverPasswordButton(_ sender: UIButton) {
        self.delegate?.tappedLogin()
    }
    
    lazy var subLoginImageView:UIImageView = {
        let image:UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gradient")
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var loginButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tappedLogindButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLogindButton(_ sender: UIButton) {
        delegate?.tappedLogin()
    }
    
    lazy var lineView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var signInMetamaskView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    lazy var signInMetamaskImageView:UIImageView = {
        let image:UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        return image
    }()
    
    lazy var signInMetamaskLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Entrar com a Metamask"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstrants()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        addSubview(subImageView)
        addSubview(logoImageView)
        addSubview(loginLabel)
        addSubview(descriptionLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(recoverPasswordButton)
        addSubview(subLoginImageView)
        addSubview(loginButton)
        addSubview(lineView)
        addSubview(signInMetamaskView)
        signInMetamaskView.addSubview(signInMetamaskImageView)
        signInMetamaskView.addSubview(signInMetamaskLabel)
    }
    
    func configConstrants() {
        NSLayoutConstraint.activate([
            subImageView.topAnchor.constraint(equalTo: topAnchor),
            subImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            subImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 55),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 108),
            logoImageView.widthAnchor.constraint(equalToConstant: 108),
            
            loginLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 11),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            recoverPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 9),
            recoverPasswordButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            subLoginImageView.topAnchor.constraint(equalTo: recoverPasswordButton.bottomAnchor, constant: 36),
            subLoginImageView.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            subLoginImageView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            subLoginImageView.heightAnchor.constraint(equalToConstant: 45),
            
            loginButton.topAnchor.constraint(equalTo: subLoginImageView.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: subLoginImageView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: subLoginImageView.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: subLoginImageView.bottomAnchor),
            
            lineView.topAnchor.constraint(equalTo: subLoginImageView.bottomAnchor, constant: 48),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            signInMetamaskView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 48),
            signInMetamaskView.leadingAnchor.constraint(equalTo: subLoginImageView.leadingAnchor),
            signInMetamaskView.trailingAnchor.constraint(equalTo: subLoginImageView.trailingAnchor),
            signInMetamaskView.heightAnchor.constraint(equalToConstant: 45),
            
            signInMetamaskImageView.leadingAnchor.constraint(equalTo: signInMetamaskView.leadingAnchor, constant: 53),
            signInMetamaskImageView.centerYAnchor.constraint(equalTo: signInMetamaskView.centerYAnchor),
            signInMetamaskImageView.heightAnchor.constraint(equalToConstant: 20),
            signInMetamaskImageView.widthAnchor.constraint(equalToConstant: 20),
            
            signInMetamaskLabel.leadingAnchor.constraint(equalTo: signInMetamaskImageView.trailingAnchor, constant: 17),
            signInMetamaskLabel.centerYAnchor.constraint(equalTo: signInMetamaskView.centerYAnchor)
            
        ])
    }
    
    
    func configTextFieldsDelegate(delegate:UITextFieldDelegate){
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
}
