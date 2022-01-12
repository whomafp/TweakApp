//
//  LoginViewModel.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 09/01/22.
//

import Foundation
import Firebase

protocol LoginViewModelProtocol {
    var didAuthSuccess: (()-> Void)? { get set }
    var didAuthError: ((NSError) -> Void)? { get set }
    func doLogin(email: String?, password: String?)
}

class LoginViewModel: BaseViewModel, LoginViewModelProtocol {
    var didAuthSuccess: (() -> Void)?
    
    var didAuthError: ((NSError) -> Void)?
    
    func doLogin(email: String?, password: String?) {
        let errorTemp = NSError(domain:"Unknown Error", code: 404, userInfo: nil)
        guard let email = email, let password = password else { self.didAuthError?(errorTemp); return }
        self.showLoading?()
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] AuthResult, error in
            self?.removeLoading?()
            if let e = error {
                self?.didAuthError?(e as NSError)
            }else {
                self?.didAuthSuccess?()
            }
        }
    }
}
