//
//  offer.swift
//  HopesAndDreams
//
//  Created by Julia Heisler on 10/15/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import Foundation
import UIKit

class Offer
{
    
    var image: UIImage
    var title: String
    var details: String
    
    init(image: UIImage,title: String ,details: String)
    {
        self.image = image
        self.title = title
        self.details = details
    }
}
