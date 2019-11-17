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
    
   let sectionTitlw = ["My Offers", "All Offers"]
       
        

    var offerarray: [Offer] = []
       
    var alloffers: [[Offer]] = [[],[]]
    
    var myOffersLoaded:Bool = false
    var allOffersLoaded:Bool = false
    
       override func viewDidLoad() {
           super.viewDidLoad()
        
        //Spinner.start(style: .white, backColor: UIColor.white, baseColor: UIColor.darkGray)
           
        createArray()
        
        
        
       // tableView.delegate = self
        //tableView.dataSource = self
        
           
       }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewOfferVC {
            let vc = segue.destination as? ViewOfferVC
            let off = sender as? OfferCell
            
            tableView.reloadData()
            print(off?.offerTitle.text)
            
            vc?.nam = off?.offerTitle.text! ?? ""
            vc?.img = off?.offerImageView.image! ?? UIImage()
            vc?.det = off?.details ?? ""

        }
    }

    
    
       
       
       func createArray()
      {
           //var tempOffer: [Offer] = []
       
           APIClient.getOffers(hash: UserDefaults.standard.string(forKey: "hashID")! ){result in
               switch result {
               case .failure(let error):
                   print(error)
               case .success(let value):
                var test = [Offer]()
                   //value is full array of dict from json
                   for item in value
                   {
                    print(item)
                    test.append(Offer(image: UIImage(named: item["image"]!)!, title: item["offer"]!, details: item["details"]!))
                      // self.offerarray.append(Offer(image: UIImage(named: item["image"]!)!, title: item["offer"]!))
                    
                    
                    
                    
                    //self.offerarray = []
                       //tempOffer.append(offer)
                       
                   }
                   self.alloffers[0] = test
                   //self.alloffers[1] = test
                
                //self.tableView.reloadData()
                self.myOffersLoaded = true
                if (self.myOffersLoaded && self.allOffersLoaded)
                {
                                       //Spinner.stop()
                self.tableView.reloadData()
                }
                
              
               }
        
               
       }
        
        APIClient.getAllOffers(hash: UserDefaults.standard.string(forKey: "hashID")! ){result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let value):
                 var test = [Offer]()
                    //value is full array of dict from json
                    for item in value
                    {
                        print(item)
                        test.append(Offer(image: UIImage(named: item["image"]!)!, title: item["offer"]!, details: item["details"]!))
                       // self.offerarray.append(Offer(image: UIImage(named: item["image"]!)!, title: item["offer"]!))
                     
                     
                     
                     
                     //self.offerarray = []
                        //tempOffer.append(offer)
                        
                    }
                    //self.alloffers[0] = test
                    self.alloffers[1] = test
                 
                 self.allOffersLoaded = true
                    
                 if (self.myOffersLoaded && self.allOffersLoaded)
                    {
                        //Spinner.stop()
                        self.tableView.reloadData()
                    }
               
                }
         
                
        }
       
       
       


       }

   }



   extension OfferVC: UITableViewDataSource, UITableViewDelegate{
       
       func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return self.sectionTitlw[section]
       }
       
       func numberOfSections(in tableView: UITableView) -> Int {
           return sectionTitlw.count
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int{
        
        //var counter = alloffers[section].count
        
        
   

        return alloffers[section].count
       }
       
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let offer = alloffers[indexPath.section][indexPath.row]
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "OfferCell") as! OfferCell
           
           
           cell.setCell(offer: offer)
           
           return cell
       }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            let selected = alloffers[indexPath.section][indexPath.row]
            print(selected)
            
        }
       
   }

