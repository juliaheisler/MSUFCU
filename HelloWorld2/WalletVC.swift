import UIKit
import Charts

class WalletVC: UIViewController{
    
    @IBOutlet weak var stockResultsFeed: UITableView!
    
    @IBOutlet weak var pieChart: PieChartView!
    
    var transactions: [TransData] = []
    var refreshControl: UIRefreshControl?
    
 
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0
        {
            stockResultsFeed.alpha = 1
            pieChart.alpha = 0
        }
        else
        {
            stockResultsFeed.alpha = 0
            pieChart.alpha = 1
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Spinner.start(style: .white, backColor: UIColor.white, baseColor: UIColor.darkGray)
        
        
        stockResultsFeed.delegate = self
        stockResultsFeed.dataSource = self
        addRefreshControl()

        
        
        stockResultsFeed.rowHeight = 80
        
        fetch_data()
        
        let months = ["Housing", "Restaurants", "Entertainment", "Groceries", "Shopping", "Automotive"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
        
        setChart(dataPoints:months, values: unitsSold)

        

        }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [PieChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: Double(values[i]), label: dataPoints[i])
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label:"")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier=1.0
        pieChartData.setValueFormatter(DefaultValueFormatter(formatter:formatter))
        
        
        var colors: [NSUIColor] = []
        
        colors.append(contentsOf: ChartColorTemplates.joyful())
        colors.append(contentsOf: ChartColorTemplates.colorful())
        pieChartDataSet.colors = colors
        pieChart.legend.enabled = true
        pieChart.legend.font = UIFont(name:"futura", size: 21)!
        
        pieChart.legend.form = .circle
        
        pieChart.legend.orientation = .vertical
        
        pieChart.legend.verticalAlignment = .bottom
        pieChart.legend.horizontalAlignment = .center
        pieChart.data = pieChartData
        
        
    }
    
    func addRefreshControl()
           {
               refreshControl = UIRefreshControl()
            refreshControl?.backgroundColor = UIColor.white
               refreshControl?.tintColor = UIColor.red
               refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
               stockResultsFeed.addSubview(refreshControl!)
               
           }
    
    @objc func refreshList()
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
                //sleep(1)
                self.refreshControl?.endRefreshing()
                self.stockResultsFeed.reloadData()
            }
            
            
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //fetch_data()
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
                Spinner.stop()
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
         
        if transactions.count != 0
        {
            let trans = transactions[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "transCell") as! TransCell
            
            cell.setTrans(transaction: trans)
            
            return cell
        }
//        let trans = transactions[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "transCell") as! TransCell
//
//        cell.setTrans(transaction: trans)
        let cell = tableView.dequeueReusableCell(withIdentifier: "transCell") as! TransCell
        return cell
        
        
        
    }
}
    

