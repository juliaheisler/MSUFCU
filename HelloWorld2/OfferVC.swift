//
//  OfferVC.swift
//  HopesAndDreams
//
//  Created by Julia Heisler on 10/15/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit
import Lottie

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
        addAni()
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
                
                    self.removeAni()
                
              
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
                    self.removeAni()
               
                }
            
            
         
                
            }
       
       

        }
    
    
    func addAni(){
        
        //Create a blur blacground
        if !UIAccessibility.isReduceTransparencyEnabled {


            let blurEffect = UIBlurEffect(style: .light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            blurEffectView.tag = 133
            blurEffectView.alpha = 0.0

            view.addSubview(blurEffectView)
            
            //Create the actrual ani view using lottie
            let animationView = AnimationView(name: "plane")
            animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            animationView.center = self.view.center
            animationView.contentMode = .scaleAspectFill
            animationView.loopMode = .loop
            animationView.tag = 233
            animationView.animationSpeed = 2.5
            
            //start it
            animationView.play()
            
            UIView.animate(withDuration: 0.3, delay: 0.0, animations: {
                blurEffectView.alpha = 1.0
            }, completion: nil)
            view.addSubview(animationView)
            
            
            
            
        }
        
        
    }
    
    func removeAni(){
        if let viewWithTag = self.view.viewWithTag(233), let viewWithTag2 = self.view.viewWithTag(133) {
            UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                viewWithTag.alpha = 0.0
                viewWithTag2.alpha = 0.0
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                viewWithTag.removeFromSuperview()
                viewWithTag2.removeFromSuperview()
            }
            }else{
                print("There is no animation views!")
            }
    }
    
    
        

   }



   extension OfferVC: UITableViewDataSource, UITableViewDelegate{
       
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor(red: 156/255.0, green: 183/255.9, blue: 175/255.0, alpha: 1.0)
            
            let sectionLabel = UILabel(frame: CGRect(x: 5, y: 2, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            sectionLabel.font = UIFont(name: "Avenir-Heavy", size: 20)
            sectionLabel.textColor = UIColor.white
            sectionLabel.text = self.sectionTitlw[section]
            sectionLabel.sizeToFit()
            headerView.addSubview(sectionLabel)
            
            return headerView
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

