//
//  ViewController.swift
//  pruebaTecnica
//
//  Created by Loducode Retina on 18/02/23.
//

import UIKit
import NotificationBannerSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var loginModel: LoginProtocols?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
    }
    
    fileprivate func setupModel() {
        if loginModel == nil {
            setModel(LoginModel())
        }
    }
    func setModel(_ Model: LoginProtocols){
        loginModel = Model
    }
    
    // MARK: - Action
    @IBAction func loginButton(_ sender: Any) {
        performLogin()
    }
    
    // MARK: - Methods Login view
    private func performLogin() {
        guard let userName = userNameField.text, !userName.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Ingresa tu usuario", style: .warning).show()
            return
        }
        guard let password = passwordField.text, !password.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Ingresa tu contraseña", style: .warning).show()
            return
        }
        
        // Crear request
        let request = TokenRequest(username: userName, password: password)
        
        loginModel?.login(token:request){ (result:(TokenResponse?,String?)) in
            
            if (result.0 != nil){
                let storyboard = UIStoryboard(name: "Home", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "home")
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true)
                // NotificationBanner(title: "Success", subtitle: "", style: .success).show()
            }else{
                // NotificationBanner(title: "Error", subtitle: "", style: .warning).show()
            }
        }
    }
    
}

