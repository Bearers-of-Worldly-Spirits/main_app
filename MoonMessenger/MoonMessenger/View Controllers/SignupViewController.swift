//
//  SignupViewController.swift
//  MoonMessenger
//
//  Created by Josh Arnold on 5/10/21.
//

import Foundation
import UIKit
import SwiftUI
import Preview
import Closures


class SignupViewController: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    var titleLabel:UILabel = UILabel.title()
    var signup:ShinyButton!
    var login:TextButton!
    var moonBackground:UIImageView = UIImageView(image: UIImage(named: "SignupMoon")!)
    
    var name:TextField = TextField(imageName: "UserIcon", placeholder: "Name")
    var email:TextField = TextField(imageName: "AtIcon", placeholder: "Email")
    var password:TextField = TextField(imageName: "LockIcon", placeholder: "Password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        hero.isEnabled = true
        view.addTapGesture { tap in
            self.view.endEditing(true)
        }
        
        moonBackground.contentMode = .scaleAspectFill
        moonBackground.alpha = 0
        moonBackground.transform = CGAffineTransform(translationX: 0, y: -100)
        view.addSubview(moonBackground)
        
        titleLabel.text = "Signup."
        titleLabel.alpha = 0
        titleLabel.transform = CGAffineTransform(translationX: 0, y: 20)
        view.addSubview(titleLabel)
        
        signup = ShinyButton("Signup") {
            self.signupUser()
        }
        signup.hero.id = "signup"
        signup.hero.modifiers = [.duration(0.5)]
        view.addSubview(signup)
        
        login = TextButton("Have an account?") {
            self.loginUser()
        }
        login.hero.id = "login"
        login.hero.modifiers = [.duration(0.3)]
        view.addSubview(login)
                
        name.transform = CGAffineTransform(translationX: -20, y: 0)
        name.alpha = 0
        name.name()
        view.addSubview(name)
        
        email.transform = CGAffineTransform(translationX: -20, y: 0)
        email.alpha = 0
        email.email()
        view.addSubview(email)
        
        password.transform = CGAffineTransform(translationX: -20, y: 0)
        password.alpha = 0
        password.secure()
        view.addSubview(password)
        
        // Snap
                        
        moonBackground.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(225)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(75)
            make.left.right.equalToSuperview()
            make.height.lessThanOrEqualToSuperview()
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(100)
            make.width.equalTo(225)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        email.snp.makeConstraints { make in
            make.top.equalTo(self.name.snp.bottom).offset(15)
            make.width.equalTo(225)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        password.snp.makeConstraints { make in
            make.top.equalTo(self.email.snp.bottom).offset(15)
            make.width.equalTo(225)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        signup.snp.makeConstraints { make in
            make.width.equalTo(170)
            make.height.equalTo(46)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.password.snp.bottom).offset(50)
        }
        
        login.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.lessThanOrEqualToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(
            withDuration: 0.9,
                    delay: 0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.7,
                    options: [],
                    animations: {
                        self.titleLabel.alpha = 1
                        self.titleLabel.transform = .identity
                        self.moonBackground.alpha = 1
                        self.moonBackground.transform = .identity
                        self.name.alpha = 1
                        self.name.transform = .identity
                        self.email.alpha = 1
                        self.email.transform = .identity
                        self.password.alpha = 1
                        self.password.transform = .identity
                    },
                    completion: nil
                )
    }
    
    func signupUser() {
        
        UIView.animate(
            withDuration: 0.7,
            delay: 0.25,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.7,
                    options: [],
                    animations: {
                        self.moonBackground.alpha = 0
                        self.moonBackground.transform = .init(translationX: 0, y: -100)
                        self.name.transform = .init(translationX: 10, y: 0)
                        self.email.transform = .init(translationX: 15, y: 0)
                        self.password.transform = .init(translationX: 20, y: 0)
                        self.name.alpha = 0
                        self.email.alpha = 0
                        self.password.alpha = 0
                    },
                    completion: nil
                )
        
        UIView.animate(withDuration: 0.3) {
            self.titleLabel.alpha = 0
            self.signup.alpha = 0
            self.login.alpha = 0
        }
    }
    
    func loginUser() {
        
    }
}


@available(iOS 13.0, *)
struct ContentView_Previews : PreviewProvider {
    static var previews : some View {
        Group {
            Preview.make(SignupViewController())
        }
    }
}

