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
    
    func setCell(offer : Offer) {
        offerImageView.image = offer.image
        offerTitle.text = offer.title
    }
    
    
}
