//
//  WalletVC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/8/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//


import UIKit

class WalletVC: UIViewController, UITableViewDataSource, UITableViewDelegate, FeedModelProtocol  {
    
    //Properties
    
    var feedItems: NSArray = NSArray()
   // var items = FeedModel.transactions 
    var selectedStock : StockCell = StockCell()
    @IBOutlet weak var stockResultsFeed: UITableView!
    //@IBOutlet weak var tempCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize FeedModel
        
        self.stockResultsFeed.delegate = self
        self.stockResultsFeed.dataSource = self
        
        let feedModel = FeedModel()
        feedModel.delegate = self
        feedModel.downloadItems()
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.stockResultsFeed.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "stockCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the stock to be shown
        let item: StockCell = feedItems[indexPath.row] as! StockCell
        // Configure our cell title made up of name and price
        
        let titleStr: String = "Date: " + item.trans_date! + " Amount: " + item.trans_amount! + "Balance: " + item.trans_balance!
        print(titleStr)
        // Get references to labels of cell
        myCell.textLabel!.text = titleStr
        
        return myCell
    }
    
}
