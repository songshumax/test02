//
//  LoginViewController.swift
//  test02
//
//  Created by Rgs on 2018/05/08.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit
import Firebase


/** @var handle
 @brief The handler for the auth state listener, to allow cancelling later.
 */
var handle: AuthStateDidChangeListenerHandle?

class LoginViewController: UIViewController {
    
    let profileImageView : UIImageView = {
       let imageView = UIImageView()
//        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "Sport-Badminton")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
        
    }()
    
    let loginRegisterButton: UIButton = {
        
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80, g: 101, b: 161)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        
        button.addTarget(self, action: #selector(LoginViewController.handleRegister), for: .touchUpInside)
        
        return button
    }()
    
    let nameTextField: UITextField = {
       
        let ntf = UITextField()
        ntf.placeholder = "Name"
        ntf.translatesAutoresizingMaskIntoConstraints = false
        return ntf
    }()
    
    let nameSeparatorView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g:220, b:220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let EmailTextField: UITextField = {
        
        let ntf = UITextField()
        ntf.placeholder = "Email"
        ntf.translatesAutoresizingMaskIntoConstraints = false
        return ntf
    }()
    
    let EmailSeparatorView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g:220, b:220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        
        let ntf = UITextField()
        ntf.placeholder = "Password"
        ntf.translatesAutoresizingMaskIntoConstraints = false
        return ntf
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        view.backgroundColor = UIColor(displayP3Red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)
        
        
        setupInputContainerView()
        setupLoginRegisterButton()
        setupprofileImageView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // [START auth_listener]
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // [START_EXCLUDE]
            print("viewWillAppear  Auth")
            
            // [END_EXCLUDE]
        }
        // [END auth_listener]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // [START remove_auth_listener]
        Auth.auth().removeStateDidChangeListener(handle!)
        // [END remove_auth_listener]
    }
    
    
    func setupprofileImageView() {
        
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    
    func setupInputContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant:-24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(EmailTextField)
        inputsContainerView.addSubview(EmailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        
        
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        EmailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        EmailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        EmailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        EmailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        EmailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        EmailSeparatorView.topAnchor.constraint(equalTo: EmailTextField.bottomAnchor).isActive = true
        EmailSeparatorView.widthAnchor.constraint(equalTo: EmailTextField.widthAnchor).isActive = true
        EmailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: EmailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: EmailTextField.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        
    }
    
    func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setupnameTextField() {
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func handleRegister () {
        
        guard let name = nameTextField.text, let password = passwordTextField.text , let email2 = EmailTextField.text else {
            print("Form is not valid")
            return
        }
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        ref.child("users").child("username").setValue(["username": name])
        ref.child("users").child("userEmail").setValue(["userEmail": email2])
        ref.child("users").child("userPassword").setValue(["userPassword": password])
	
        // [START create_user]
        Auth.auth().createUser(withEmail: email2, password: password) { (authResult, error) in
            // [START_EXCLUDE]
            
            guard let _ = authResult?.email, error == nil else {
                print(error!.localizedDescription)
                print(error.debugDescription)
//                print(error?.localizedDescription)
                return
            }
            print("\(email2) created")
            // [END_EXCLUDE]
            
            print(123)
        }
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    
    }
}
