//
//  OfferVC.swift
//  HopesAndDreams
//
//  Created by Julia Heisler on 10/15/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class OfferVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var offerarray: [Offer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        offerarray = createArray()
        
    }
    
    func createArray() -> [Offer]
   {
        var tempOffer: [Offer] = []
    
        let offer1 = Offer(image: UIImage(named: "hungryhowies")!, title: "Hungry Howies Offer")
        let offer2 = Offer(image: UIImage(named: "eyecare")!, title: "Eye Care Offer")
        let offer3 = Offer(image: UIImage(named: "davenport")!, title: "Devenport Offer")
        let offer4 = Offer(image: UIImage(named: "moosejaw")!, title: "Moosejaw Offer")

        tempOffer.append(offer1)
        tempOffer.append(offer2)
        tempOffer.append(offer3)
        tempOffer.append(offer4)
    
        return tempOffer

    }

}



extension OfferVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int{
        return offerarray.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let offer = offerarray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OfferCell") as! OfferCell
        
        
        cell.setCell(offer: offer)
        
        return cell
    }
    
}

