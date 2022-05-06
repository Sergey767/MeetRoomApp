//
//  AuthViewController.swift
//  MeetRoomApp
//
//  Created by Сергей Горячев on 01.05.2022.
//

import UIKit

final class AuthViewController: UIViewController {
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginDetails = UserDefaults.standard.value(forKey: "login")
        if loginDetails != nil {
            loginTextField.text = UserDefaults.standard.value(forKey: "login") as? String
            passwordTextField.text = UserDefaults.standard.value(forKey: "password") as? String
        }
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Сохранение", message: "Вы хотите сохранить данные для входа ?", preferredStyle: .alert)
        
        let yesButton = UIAlertAction(title: "Yes", style: .default) { (action) in
            
            UserDefaults.standard.set(self.loginTextField.text!, forKey: "login")
            UserDefaults.standard.set(self.passwordTextField.text!, forKey: "password")
            self.performSegue(withIdentifier: "showCalendarDailyViewController", sender: self)
        }
        
        let noButton = UIAlertAction(title: "No", style: .default) { (action) in
            print("Вы не сохранили данные для входа")
            self.performSegue(withIdentifier: "showCalendarDailyViewController", sender: self)
        }
        
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        
    }
}

