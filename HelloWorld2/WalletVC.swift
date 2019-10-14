import UIKit

class WalletVC: UIViewController{//, UITableViewDataSource, UITableViewDelegate {
    
    
    
    //Properties
    
    
    // var items = FeedModel.transactions
    var selectedStock : StockCell = StockCell()
    var feedItems = [StockCell]()
    
    @IBOutlet weak var stockResultsFeed: UITableView!
    //@IBOutlet weak var tempCell: UITableViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize FeedModel
        let hash = UserDefaults.standard.string(forKey: "hashID") ?? ""
        
        let result = APIClient.getTransactions(acct: "11134090", rows: "20", hash: hash)

        for item in result{
            let stock = StockCell()
            stock.trans_date = item["trans_date"]
            stock.trans_balance = item["trans_balance"]
            stock.trans_amount = item["trans_amount"]
            stock.trans_desc = item["trans_desc"]
            feedItems.append(stock)

        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        // Retrieve cell

        let myCell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)

        // Get the stock to be shown
        let item: StockCell = feedItems[indexPath.item]
        // Configure our cell title made up of name and price

        let titleStr: String = "Date: " + item.trans_date! + " Amount: " + item.trans_amount! + "Balance: " + item.trans_balance!
        print(titleStr)
        // Get references to labels of cell
        myCell.textLabel!.text = titleStr


        return myCell
    }
    
}
