import UIKit


class WalletVC: UIViewController{
    
    @IBOutlet weak var stockResultsFeed: UITableView!
    
    
    var transactions: [TransData] = []
    //var temp: [TransData] = []
    
    
    
    //Properties
  
    
    
  
    
    

    //@IBOutlet weak var tempCell: UITableViewCell!
    
//    private func setupTableView() {
//        stockResultsFeed.isHidden = true
//        // Add Refresh Control to Table View
//        if #available(iOS 10.0, *) {
//            stockResultsFeed.refreshControl = refreshControl
//        } else {
//            stockResultsFeed.addSubview(refreshControl)
//        }
//    }
    
//    lazy var refreshControl: UIRefreshControl = {
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action:
//            #selector(ViewController.handleRefresh(_:)),
//                                 for: UIControlEvents.valueChanged)
//        refreshControl.tintColor = UIColor.red
//
//        return refreshControl
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        stockResultsFeed.delegate = self
        stockResultsFeed.dataSource = self
        
        
        stockResultsFeed.rowHeight = 80
        
        APIClient.getTransactions(acct: "11134090", rows: "20"){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                //value is full array of dict from json
                for item in value
                {
                    self.transactions.append(TransData(trans_desc: item["trans_desc"]!, trans_amount: item["trans_amount"]!, trans_date: item["trans_date"]!, trans_balance: item["trans_balance"]!))
                    
                }
                self.stockResultsFeed.reloadData()
            }
            
            
        }
        
        
        
        
        
        
//        let result = APIClient.getTransactions(acct: "11134090", rows: "20")

   

        }
        
    
        
        
    }


extension WalletVC: UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trans = transactions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "transCell") as! TransCell
        
        cell.setTrans(transaction: trans)
        
        return cell
        
        
        
    }
}
    

