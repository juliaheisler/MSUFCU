import UIKit

class WalletVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    //Properties
    
    
    // var items = FeedModel.transactions
    var selectedStock : StockCell = StockCell()
    var feedItems = [StockCell]()
    @IBOutlet weak var resultsFeed: UITableView!
    //
//    @IBOutlet weak var stockResultsFeed: UITableView!
    //@IBOutlet weak var tempCell: UITableViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize FeedModel
        //let hash = UserDefaults.standard.string(forKey: "hashID") ?? ""
        
        resultsFeed.delegate = self
        resultsFeed.dataSource = self
        
        // call gettrans from apiclient
        APIClient.getTransactions(acct: "11134090", rows: "20"){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                //value is full array of dict from json
                let transactions = value
                for item in transactions{
                    let stock = StockCell()
                    stock.trans_date = item["trans_date"]
                    stock.trans_balance = item["trans_balance"]
                    stock.trans_amount = item["trans_amount"]
                    stock.trans_desc = item["trans_desc"]
                    //print(stock)
                    self.feedItems.append(stock)

                }
                self.resultsFeed.reloadData()
                
            }
        }
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        print(feedItems.count)
        return feedItems.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        // Retrieve cell

        let cell = tableView.dequeueReusableCell(withIdentifier:"PlainCell", for: indexPath)

        // Get the stock to be shown
        let item: StockCell = feedItems[indexPath.item]
        // Configure our cell title made up of name and price

        let titleStr: String = "Date: " + item.trans_date! + " Amount: " + item.trans_amount! + "Balance: " + item.trans_balance!
        print(titleStr)
        // Get references to labels of cell
        cell.textLabel!.text = titleStr


        return cell
    }
    
}
