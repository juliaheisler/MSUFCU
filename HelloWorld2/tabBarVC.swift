//
//  tabBarVC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/12/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class tabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        //if there is a notification
        self.addDotAtTabBarItemIndex(index: 3)

        // Do any additional setup after loading the view.
    }
    

    
    
    
    
    func addDotAtTabBarItemIndex(index: Int, radius: CGFloat = 5, color : UIColor = UIColor.red, text : String? = nil, xOffset: CGFloat = 0, yOffset: CGFloat = 0) {
        let tag = index + 999
        
        removeDotAtTabBarItemIndex(index: index)
        let dotDiameter = radius * 2
        let xOffsetBase = CGFloat(21)
        let yOffsetBase = CGFloat(3)
        
        if text == nil {
            let dot = UIView(frame: CGRect(x: xOffsetBase + xOffset, y: yOffsetBase + yOffset, width: dotDiameter, height: dotDiameter))
            dot.tag = tag
            dot.backgroundColor = color
            dot.layer.cornerRadius = radius
            tabBar.subviews[index + 1].subviews.first?.insertSubview(dot, at: 1)
        } else {
            let label = UILabel(frame: CGRect(x: xOffsetBase + xOffset, y: yOffsetBase + yOffset, width: dotDiameter, height: dotDiameter))
            label.tag = tag
            label.numberOfLines = 1
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.3
            label.text = text!
            tabBar.subviews[index + 1].subviews.first?.insertSubview(label, at: 1)
        }
    }
    
    func removeDotAtTabBarItemIndex(index: Int) {
        let tag = index + 999
        if let subviews = tabBar.subviews[index + 1].subviews.first?.subviews {
            for subview in subviews where subview.tag == tag {
                subview.removeFromSuperview()
            }
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
