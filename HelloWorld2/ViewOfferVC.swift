//
//  ViewOfferVC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 11/15/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class ViewOfferVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
    var nam : String = ""
    var img : UIImage = UIImage()
    var det : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        name.text = nam
        image.image = img
        desc.text = det

        // Do any additional setup after loading the view.
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
