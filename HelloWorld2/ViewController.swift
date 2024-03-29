//
//  ViewController.swift
//  HelloWorld2
//
//  Created by Julia Heisler on 9/9/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//  Main Login Page
//
import UIKit
import Lottie

class ViewController: UIViewController {
    

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }
// if login button pressed
    @IBAction func buttonPressed(_ sender: Any) {
        
        guard let username = email.text, let pw = password.text, username.count > 0, pw.count > 0 else {return}
        
        view.endEditing(true)
        //begin animation
        addAni()
        handleLogin()
        
    }
    func handleLogin(){
        
        //attempt to login user -- get hash value from user defaults
        APIClient.getHash(username: email.text!, password: password.text! ){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                UserDefaults.standard.set(value, forKey: "hashID")
                //value is full array of dict from json
                
                
                self.handleNoti()
            }
            
            
            
        }
        
        
        
    }
    
    func handleNoti(){

        self.forceAni()
            
        
        
        
    }
    
    func switchSB(){
        
        if let viewWithTag = self.view.viewWithTag(233), let viewWithTag2 = self.view.viewWithTag(133){
            if (UserDefaults.standard.string(forKey: "hashID") != "error")
            {
                UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                    viewWithTag.alpha = 0.0
                }, completion: nil)

               //Previous Code
                let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
                let Dashboard = storyBoardHome.instantiateViewController(withIdentifier: "TabBar")
                self.removeAni()
                self.navigationController?.pushViewController(Dashboard, animated: false)
                
            }
            Toast.show(message: "Login failed, the email or password is incorrect.", controller: self)
            
            UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                          viewWithTag.alpha = 0.0
                          viewWithTag2.alpha = 0.0
                      }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.removeAni()
            }
        }

    }
    
    func addAni(){
        
        //Create a blur blacground
        if !UIAccessibility.isReduceTransparencyEnabled {


            let blurEffect = UIBlurEffect(style: .light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            blurEffectView.tag = 133
            blurEffectView.alpha = 0.0

            view.addSubview(blurEffectView)
            
            //Create the actrual ani view using lottie
            let animationView = AnimationView(name: "plane")
            animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            animationView.center = self.view.center
            animationView.contentMode = .scaleAspectFill
            animationView.loopMode = .loop
            animationView.tag = 233
            animationView.animationSpeed = 2.5
            
            
            
            view.addSubview(animationView)
            //start it
            animationView.play()
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: {
                blurEffectView.alpha = 1.0
            }, completion: nil)
            
        }
        
        
    }
    
    func removeAni(){
        if let viewWithTag = self.view.viewWithTag(233) {
                viewWithTag.removeFromSuperview()
            }else{
                print("There is no ani view!")
            }
        if let viewWithTag = self.view.viewWithTag(133) {
            viewWithTag.removeFromSuperview()
        }else{
            print("There is no blur view!")
        }
    }
    
    //Force the animation to display for one second and then go though other logics.
    func forceAni(){
        if let viewWithTag = self.view.viewWithTag(233) as? AnimationView{
            if viewWithTag.currentTime < 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.switchSB()
                }
            }
        }
    }
        
    
}
