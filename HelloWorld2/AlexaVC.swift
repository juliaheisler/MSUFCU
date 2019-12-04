//
//  AlexaVC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 11/5/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

//Setting
class AlexaVC: UIViewController {

    @IBOutlet weak var alexaEmail: UITextField!
    @IBOutlet weak var pin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.setNavigationBarHidden(false, animated: false)

    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        if validateEmail(field: alexaEmail)==nil{
            showToast(controller: self, message: "Not a valid email", seconds: 1.5)
        } else{
            //showToast(controller: self, message: "Valid email", seconds: 1.5)
            //APIClient.setAlexaPin(hash: UserDefaults.standard.string(forKey: "hashID")!, email: alexaEmail.text!, pin: pin.text!)
        }
        
        if validatePin(field: pin)==nil{
            showToast(controller: self, message: "PIN must be 4 digits", seconds: 1.5)
        }
        
        
    }
    
    func validateEmail(field:UITextField)->String?{
        guard let trimmedEmail = field.text?.trimmingCharacters(in: .whitespacesAndNewlines) else{
            return nil
        }
        
        guard let dataDetector = try? NSDataDetector(types:NSTextCheckingResult.CheckingType.link.rawValue) else {
            return nil
        }
        
        let range = NSMakeRange(0,NSString(string: trimmedEmail).length)
        let allMatches = dataDetector.matches(in: trimmedEmail, options: [], range: range)
        
        if allMatches.count==1, allMatches.first?.url?.absoluteString.contains("mailto:")==true {
            return trimmedEmail
        }
        return nil
    }
    
    func validatePin(field:UITextField)->String?{
        guard let trimmedPin = pin.text?.trimmingCharacters(in: .whitespacesAndNewlines) else{
            return nil
        }
        
        if trimmedPin.count != 4{
            return nil
        }
        return trimmedPin
    }
    
    func showToast(controller: UIViewController, message: String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+seconds){
            alert.dismiss(animated: true)
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
