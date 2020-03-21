//
//  ViewController.swift
//  LoginPage
//
//  Created by Taylor Chavez on 3/21/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var logo = UIImage(named: "paypalLogo")
    var username = UITextField()
    var usernameBorder = UIView()
    var password = UITextField(frame: CGRect(x:0,y:0,width:100,height:100))
    var passwordBorder = UIView()
    var forgotPass = UILabel()
    var toggleUsernameMethod = UILabel()
    var signUp = UILabel()
    var login = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        moreSetup()
    }

    
    func setUpUI(){
        let parentConstarints = self.view.frame
        let logoView = UIImageView(image:logo)
//        logoView.translatesAutoresizingMaskIntoConstraints = false
//        username.translatesAutoresizingMaskIntoConstraints = false
//        password.translatesAutoresizingMaskIntoConstraints = false
        logoView.frame = CGRect(x:(parentConstarints.width/2)-40, y: 80, width: 80, height: 80)
        let inputWidths = parentConstarints.width-40
        username.frame = CGRect(x:20,y:300,width: inputWidths,height:40)
        username.textAlignment = NSTextAlignment(.left)
        username.placeholder = "Email"
        username.addTarget(self, action: #selector(onUsername), for: .touchDown)
        usernameBorder.frame = CGRect(x:20,y:340,width: inputWidths,height:3)
        usernameBorder.backgroundColor = .gray
        password.frame = CGRect(x:20,y:350,width: inputWidths,height:40)
        password.textAlignment = NSTextAlignment(.left)
        password.addTarget(self, action: #selector(onPassword), for: .touchDown)
        password.placeholder = "Password"
        passwordBorder.frame = CGRect(x:20,y:390,width: inputWidths,height:3)
        passwordBorder.backgroundColor = .gray
        forgotPass.text = "Forgot?"
        forgotPass.frame = CGRect(x:parentConstarints.width - 90,y:350,width: 70,height: 40)
        forgotPass.textColor = .blue
        toggleUsernameMethod.text = "use phone number instead"
        toggleUsernameMethod.frame = CGRect(x:0,y:400,width:parentConstarints.width,height: 40)
        toggleUsernameMethod.textColor = .blue
        toggleUsernameMethod.textAlignment = .center
        self.view.addSubview(logoView)
        self.view.addSubview(username)
        self.view.addSubview(usernameBorder)
        self.view.addSubview(password)
        self.view.addSubview(passwordBorder)
        self.view.addSubview(forgotPass)
        self.view.addSubview(toggleUsernameMethod)
    }
    
    func moreSetup(){
        login.translatesAutoresizingMaskIntoConstraints = false
        signUp.translatesAutoresizingMaskIntoConstraints = false
        //let margins2 = view.layoutMarginsGuide
        let margins = view.safeAreaLayoutGuide
        let constraints = [
            login.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            login.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            login.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            login.heightAnchor.constraint(equalToConstant: CGFloat(50)),
            signUp.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -25),
            signUp.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            signUp.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            signUp.heightAnchor.constraint(equalToConstant: CGFloat(100))
        ]
        signUp.text = "New to Paypal? Sign Up!"
        signUp.textColor = .black
        signUp.textAlignment = .center
        //signUp.backgroundColor = .green
        login.textColor = .white
        login.backgroundColor = .blue
        login.text = "Login"
        login.textAlignment = NSTextAlignment(.center)
        view.addSubview(login)
        view.addSubview(signUp)
        view.addConstraints(constraints)
    }
    
    @objc func onUsername(){
        usernameBorder.backgroundColor = .blue
        passwordBorder.backgroundColor = .gray
    }

    @objc func onPassword(){
        usernameBorder.backgroundColor = .gray
        passwordBorder.backgroundColor = .blue
    }
    
}

