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
        //check notification status
        if (UserDefaults.standard.bool(forKey: "notificationStatus") == true)
        {
            self.addRedDotAtTabBarItemIndex(index: 5)
            
        }
        

        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let tabBarIndex = self.selectedIndex
        if tabBarIndex == 0 {
            removeRedDotAtTabBarItemIndex(index: 5)
        }
    }
    
    
    var Dots = [UIView](repeating: UIView(), count: 6)

    func addRedDotAtTabBarItemIndex(index: Int) {

        if  self.Dots[index].tag != index {

            let RedDotRadius: CGFloat = 5
            let RedDotDiameter = RedDotRadius*2
            let yOffsetBase = CGFloat(3)


            let tabSize = self.view.frame.width / CGFloat(5)

            let  xPosition = tabSize * CGFloat(index - 1)

            let tabHalfWidth: CGFloat = tabSize / 2

            self.Dots[index] =  UIView(frame: CGRect(x: xPosition + tabHalfWidth - 1, y: yOffsetBase, width: RedDotDiameter, height: RedDotDiameter))

            self.Dots[index].tag = index
            self.Dots[index].backgroundColor = UIColor.red
            self.Dots[index].layer.cornerRadius = RedDotRadius

            self.tabBar.addSubview(self.Dots[index])

        }
    }
    
    func removeRedDotAtTabBarItemIndex(index: Int) {

        self.Dots[index].removeFromSuperview()
        self.Dots[index].tag = 0
    }


}
