//
//  SignUpViewController.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 08/01/22.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

class SignUpViewController : UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Vars
    var fetchedImageData: Data?
    
    
    
    var imagePicker: UIImagePickerController!
    private let storage = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfilePicture()
        self.dismissKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "SignUp"
    }
    
    private func uploadImage(data: Data){
        let fileName = nameTextField.text ?? "no name"
        storage.child("images/\(fileName).png").putData(data, metadata: nil) { _, error in
            guard error == nil else{
                print ("failed to upload")
                return
            }
        }
        
    }
    private func setupProfilePicture(){
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(imageTap)
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        
    }
    
    @objc func openImagePicker(_ sender:Any) {
        // Open Image Picker
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func signUpTapped(_ sender: UIButton?) {
        guard let name = nameTextField.text,!name.isEmpty else {return}
        if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    //Create alert
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    //Add action
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    
                    
                    // show the alert
                    self?.present(alert, animated: true, completion: nil)
                    
                }else {
                    DatabaseMannager.shared.insertUser(with: User(fullname: name, emailAddress: email, password: password))
                    self?.uploadImage(data: self?.fetchedImageData ?? Data())
                    self?.performSegue(withIdentifier: "RegisterToNewsFeed", sender: self)
                }
            }
        }
        
    }
    
    
    
    @IBAction func logInTapped(_ sender: UIButton?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "logIn")
        vc.modalPresentationStyle = .overFullScreen
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        guard let imageData = image.pngData() else {return}
        fetchedImageData = imageData
        profileImageView.image = image
    }
}
