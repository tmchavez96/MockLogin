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
    var logoView = UIImageView()
    var username = UITextField()
    var usernameBorder = UIView()
    var password = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
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

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print(size)
        reAllignUI(size: size)
        print("shabba rights")
    }

    func reAllignUI(size: CGSize) {
        UIView.animate(withDuration: 0.25) {
            print("animating")
            let parentWidth: Int = Int(size.width)
            let parentHeight: Int = Int(size.height)
            let heightStart: Int = Int(size.height/3)
            let xIndent: Int = (parentWidth > parentHeight ?  80 :  40)
            print(xIndent)
            //disable ?
            self.logoView.frame = CGRect(x: ((parentWidth/2)-xIndent), y: (parentWidth > parentHeight ? 10:80), width: 80, height: 80) //swiftlint:disable line_length
            let inputWidths = parentWidth-xIndent
            self.username.frame = CGRect(x: xIndent/2, y: heightStart, width: inputWidths, height: 40)
            self.usernameBorder.frame = CGRect(x: xIndent/2, y: heightStart+40, width: inputWidths, height: 3)
            self.password.frame = CGRect(x: xIndent/2, y: heightStart+50, width: inputWidths, height: 40)
            self.passwordBorder.frame = CGRect(x: xIndent/2, y: heightStart+90, width: inputWidths, height: 3)
            self.forgotPass.frame = CGRect(x: parentWidth - 90, y: heightStart+50, width: 70, height: 40)
            self.toggleUsernameMethod.frame = CGRect(x: 0, y: heightStart+100, width: parentWidth, height: 40)
        }
    }

    func setUpUI() {
        logoView = UIImageView(image: logo)
        //set elementt frames based in view frame
        reAllignUI(size: self.view.frame.size)
        username.textAlignment = NSTextAlignment(.left)
        username.placeholder = "Email"
        username.addTarget(self, action: #selector(onUsername), for: .touchDown)
        usernameBorder.backgroundColor = .gray
        password.textAlignment = NSTextAlignment(.left)
        password.addTarget(self, action: #selector(onPassword), for: .touchDown)
        password.placeholder = "Password"
        passwordBorder.backgroundColor = .gray
        forgotPass.text = "Forgot?"
        forgotPass.textColor = .blue
        toggleUsernameMethod.text = "use phone number instead"
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

    //constraint layout
    func moreSetup() {
        login.translatesAutoresizingMaskIntoConstraints = false
        signUp.translatesAutoresizingMaskIntoConstraints = false
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
        login.textColor = .white
        login.backgroundColor = .blue
        login.text = "Login"
        login.textAlignment = NSTextAlignment(.center)
        view.addSubview(login)
        view.addSubview(signUp)
        view.addConstraints(constraints)
    }

    //toggle the border of username field
    @objc func onUsername() {
        usernameBorder.backgroundColor = .blue
        passwordBorder.backgroundColor = .gray
    }

    //toggle the border of password
    @objc func onPassword() {
        usernameBorder.backgroundColor = .gray
        passwordBorder.backgroundColor = .blue
    }

}
