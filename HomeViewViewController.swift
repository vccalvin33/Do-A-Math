//
//  HomeViewViewController.swift
//  Do-A-Math
//
//  Created by Vincentius Calvin on 10/03/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit


class HomeViewViewController: UIViewController, UITextFieldDelegate {
    
    var name : String?
    
    @IBOutlet weak var enterView: UIView!
    @IBOutlet weak var NameTextView: UIView!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var PlayView: UIView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var FlippedDownwards: UIImageView!
    @IBOutlet weak var Downwards: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        welcomeLabel.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.35).cgColor
        welcomeLabel.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        welcomeLabel.layer.shadowOpacity = 1.0
        welcomeLabel.layer.shadowRadius = 5.0
        welcomeLabel.layer.masksToBounds = false
        welcomeLabel.layer.cornerRadius = 18
        PlayView.layer.cornerRadius = 18
        NameTextView.layer.cornerRadius = 18
        enterView.layer.cornerRadius = 18

        UIView.animate(withDuration: 0.25, delay: 0, options: [.repeat,.autoreverse], animations: {
            self.Downwards.frame = CGRect(x: 91, y: 260, width: 112, height: 80)
        })
        
        UIView.animate(withDuration: 0.25, delay: 0.25, options: [.repeat,.autoreverse], animations: {
            self.FlippedDownwards.frame = CGRect(x: 211, y: 260, width: 112, height: 80)
        })
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
        NameTextField.delegate = self
        

    
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField) {
        NameTextField.text = ""
    }
    
    
    
    @IBAction func enterButton(_ sender: Any) {
        
        if let text = NameTextField.text, text.isEmpty {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.autoreverse], animations: {
                self.NameTextView.frame = CGRect(x: 28, y: 397, width: 374, height: 59)
            })
            UIView.animate(withDuration: 0.1, delay: 0.1, options: [.autoreverse], animations: {
            self.NameTextView.frame = CGRect(x: 20, y: 397, width: 374, height: 59)
            })
            
        } else {

            if (NameTextField.text?.first)! == " " || NameTextField.text == "Enter your username..."{
                UIView.animate(withDuration: 0.1, delay: 0, options: [.autoreverse], animations: {
                    self.NameTextView.frame = CGRect(x: 28, y: 397, width: 374, height: 59)
                })
                UIView.animate(withDuration: 0.1, delay: 0.1, options: [.autoreverse], animations: {
                self.NameTextView.frame = CGRect(x: 20, y: 397, width: 374, height: 59)
                })
            } else {
                name = NameTextField.text
                performSegue(withIdentifier: "toLevelsView", sender: self)
            }
        }
    }
    
    func tap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == ""{
            textField.text = "Enter your username..."
            textField.textColor = UIColor.lightGray
        }
        textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Enter your username..."{
            textField.text = ""
            textField.textColor = UIColor.black
        }
        textField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationView = segue.destination as? ChooseLevelViewController
        
        if let txt = name{
            destinationView?.username = txt
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
