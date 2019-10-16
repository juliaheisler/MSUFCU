import UIKit


class WalletVC: UIViewController{
    
    @IBOutlet weak var stockResultsFeed: UITableView!
    
    
    var transactions: [TransData] = []
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        stockResultsFeed.delegate = self
        stockResultsFeed.dataSource = self
        
        
        stockResultsFeed.rowHeight = 80
        
        fetch_data()
        

        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch_data()
        print("refresh")
    }
    
    
    func fetch_data()
    {
        self.transactions = []
        
        APIClient.getTransactions(acct: "11134027", rows: "20"){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                //value is full array of dict from json
                for item in value
                {
                    self.transactions.append(TransData(trans_desc: item["trans_desc"]!, trans_amount: item["trans_amount"]!, trans_date: item["trans_date"]!, trans_balance: item["trans_balance"]!))
                   
                    
                   
                    print(item)
                    
                    
                }
                self.stockResultsFeed.reloadData()
            }
            
            
        }
    }
    
        
    
        
        
    }


extension WalletVC: UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(transactions.count)
        return transactions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trans = transactions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "transCell") as! TransCell
        
        cell.setTrans(transaction: trans)
        
        return cell
        
        
        
    }
}
    

