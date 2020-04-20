//
//  RegistrationViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 17/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var buttonNext: DarkBasicButton!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let signUpManager = AuthentificationService()
    let db = Firestore.firestore()
    let onboardingController = OnBoarding1ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonNextClicked(_ sender: Any) {
        activityIndicator.startAnimating()
        self.errorLabel.text = ""
        
        if let email = inputEmail.text, let password = inputPassword.text, let firstname = inputFirstName.text {
            signUpManager.createUser(email: email, password: password, firstname: firstname) {[weak self] (success) in
                guard let `self` = self else { return }
                if (success) {
                    self.errorLabel.text = "User created!"
                    self.activityIndicator.stopAnimating()
                    
                    let onBoardingView: UIStoryboard = UIStoryboard(name: "OnBoarding", bundle: nil)
                    let onBoarding1VC = onBoardingView.instantiateViewController(identifier: "OnBoarding1ViewController")
                    self.show(onBoarding1VC, sender: nil)
                } else {
                    self.errorLabel.text = "Tu as fait une erreur ! Vérifie les infos"
                    self.activityIndicator.stopAnimating()
                }
            }
        }
            
    }
    
    @IBAction func buttonCancelClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


