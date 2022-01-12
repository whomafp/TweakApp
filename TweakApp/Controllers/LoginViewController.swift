//
//  ViewController.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 08/01/22.
//
import UIKit

class LoginViewController : UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let segueToHomeIdentifier = "LoginToNewsFeed"
    
    lazy var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        setupViewModel()
        self.dismissKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "Login"
    }
    
    private func setupViewModel() {
        viewModel.showLoading = {
            self.showSpinner(onView: self.view)
        }
        
        viewModel.removeLoading = { [weak self] in
            self?.removeSpinner()
        }
        
        viewModel.didAuthSuccess = {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: self.segueToHomeIdentifier, sender: self)
            }
        }
        
        viewModel.didAuthError = { [weak self] error in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func LoginTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            self.viewModel.doLogin(email: email, password: password)
        }
    }
    
    
    @IBAction func CreateAccountTapped(_ sender: UIButton) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
            vc.modalPresentationStyle = .overFullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
