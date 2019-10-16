//
//  NotificationCell.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/15/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var notif: UILabel!
    
    
    func setNotif(notification: String)
    {
        notif.text  = notification
        
    }
    
    
    

}
