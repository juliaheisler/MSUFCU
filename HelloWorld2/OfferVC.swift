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
        
        createArray()
        
    }
    
    
    func createArray()
   {
        //var tempOffer: [Offer] = []
    
        APIClient.getOffers(hash: UserDefaults.standard.string(forKey: "hashID")! ){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                //value is full array of dict from json
                for item in value
                {
                    //print(item)
                    self.offerarray.append(Offer(image: UIImage(named: item["image"]!)!, title: item["offer"]!))
                    print(self.offerarray)
                    //tempOffer.append(offer)
                    
                }
                self.tableView.reloadData()
           
            }
        
        
        
    }
    
    
    
//        let offer1 = Offer(image: UIImage(named: "hungryhowies")!, title: "Hungry Howies Offer")
//        let offer3 = Offer(image: UIImage(named: "davenport")!, title: "Davenport Offer")
//        let offer4 = Offer(image: UIImage(named: "Moosejaw_Discount")!, title: "Moosejaw Offer")
//
//        tempOffer.append(offer1)
//        tempOffer.append(offer3)
//        tempOffer.append(offer4)
    
   
    
        //return tempOffer

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

