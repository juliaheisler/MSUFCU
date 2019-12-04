//
//  NewUser2VC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/12/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

//second new user page (account information)
class NewUser2VC: UIViewController {

    
    @IBAction func cont(_ sender: Any) {
        
        //method for getting hash value for the new user -- existing account hack
        APIClient.getHashNewUser(firstname: first.text!, lastname: last.text!, account: acct.text!, password: "msufcuAPIkey"){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                UserDefaults.standard.set(value, forKey: "hashID")
                //value is full array of dict from json
                
                
            }
            
            
            
        }
        
        
    }
    
    @IBOutlet weak var acct: UITextField!
    @IBOutlet weak var last: UITextField!
    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var birthdate: UITextField!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        
        birthdate.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)),for: .valueChanged )
        _ = UITapGestureRecognizer(target: self, action: #selector(NewUser2VC.viewTapped(gestureRecognizer:)))
        // Do any additional setup after loading the view.
        
        
        
        
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        view.endEditing(true)
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        birthdate.text = dateFormatter.string(from: datePicker.date)
    
        
    }

}
