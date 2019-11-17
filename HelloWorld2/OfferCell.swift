//
//  OfferCell.swift
//  HopesAndDreams
//
//  Created by Julia Heisler on 10/15/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class OfferCell: UITableViewCell {
    
    @IBOutlet weak var offerImageView: UIImageView!
    
    @IBOutlet weak var offerTitle: UILabel!
    
    var details: String = ""
    
    var offer: Offer = Offer(image: UIImage.init(), title: "", details: "")
    
    func setCell(offer : Offer) {
        self.offer = offer
        offerImageView.image = offer.image
        offerTitle.text = offer.title
        details = offer.details
    }
    
    
}
