//
//  ViewController.swift
//  HelloWorld2
//
//  Created by Julia Heisler on 9/9/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
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

    @IBAction func buttonPressed(_ sender: Any) {
        
        guard let username = email.text, let pw = password.text, username.count > 0, pw.count > 0 else {return}
        
//        APIClient.getHashValue(username: email.text!, password: password.text! )
//       // print(UserDefaults.standard.object(forKey: "hashID"))
//
//        //UserDefaults.standard.string(forKey: "hashID") != "error"
//        if (singleton.hashID != "error")
//        {
//            let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
//            let Dashboard = storyBoardHome.instantiateViewController(withIdentifier: "TabBar")
//            self.navigationController?.pushViewController(Dashboard, animated: true)
//
//        }
        
        
        addAni()
        handleLogin()
        
    }
    //APIClient.getHashValue(username: email.text!, password: password.text!
    func handleLogin(){
        //APIClient.getHashValue(username: email.text!, password: password.text! )
        
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
                APIClient.getNotificationStatus(hash: UserDefaults.standard.string(forKey: "hashID")!){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                if value == "1"
                   {
                     UserDefaults.standard.set(true, forKey: "notificationStatus")
                    
                   }else
                   {
                     UserDefaults.standard.set(false, forKey: "notificationStatus")
                    }
                
                //Force animation then run the verification of login.
                self.forceAni()
            }
            
            
            
        }
        
        
        
    }
    
    func switchSB(){
        if (UserDefaults.standard.string(forKey: "hashID") != "error")
        {
            let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
            let Dashboard = storyBoardHome.instantiateViewController(withIdentifier: "TabBar")
            self.navigationController?.pushViewController(Dashboard, animated: true)
        }
        removeAni()
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

            view.addSubview(blurEffectView)
        }
        
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
            print(viewWithTag.currentTime)
            if viewWithTag.currentTime < 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                   print(viewWithTag.currentTime)
                    self.switchSB()
                }
            }
        }
    }
        
    
}
