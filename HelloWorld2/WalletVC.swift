import UIKit
import Charts

class WalletVC: UIViewController{
    
    @IBOutlet weak var stockResultsFeed: UITableView!
    
    @IBOutlet weak var pieChart: PieChartView!
    
    var transactions: [TransData] = []
    var tempTrans: [TransData] = []
    var categories: [String] = []
    var cats: [String] = []
    var amounts: [Double] = []
    var refreshControl: UIRefreshControl?
    var bal: Double = 1.0
    var dataEntries: [PieChartDataEntry] = []
    var highlighted: Bool = false
    var highlight: Double = 0.0
    var goalAmt : Double = 0.0
    

    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var actualBalance: UILabel!
    
    @IBOutlet weak var tableTop: NSLayoutConstraint!
    @IBOutlet weak var pieBottom: NSLayoutConstraint!
    
    @IBOutlet weak var tableTitle: UILabel!
    @IBOutlet weak var tableStack: UIStackView!
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0
        {
            stockResultsFeed.alpha = 1
            pieChart.alpha = 0
            tableTop.constant = 13
            tableTitle.text = "Balance"
            tableStack.alpha = 1
            if tempTrans.isEmpty == false {
                transactions = tempTrans
                tempTrans = []
            }
            tableStack.frame.size.height = 115
            stockResultsFeed.layoutIfNeeded()
            stockResultsFeed.reloadData()
            refreshList()
        }
        else
        {
            tableStack.frame.size.height = 13
            stockResultsFeed.alpha = 0
            pieChart.alpha = 1
            highlighted = false
            pieBottom.constant = 0
            pieChart.highlightValues([])
            setChart(dataPoints:categories, values: amounts)
            stockResultsFeed.layoutIfNeeded()
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Spinner.start(style: .white, backColor: UIColor.white, baseColor: UIColor.darkGray)
        
        
        stockResultsFeed.delegate = self
        stockResultsFeed.dataSource = self
        addRefreshControl()
        
        stockResultsFeed.rowHeight = 80
        stockResultsFeed.layoutMargins = UIEdgeInsets.zero
        stockResultsFeed.separatorInset = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 10.0, right: 0.0)
        stockResultsFeed.separatorColor=UIColor.black;
        
        
//        let months = ["Housing", "Restaurants", "Entertainment", "Groceries", "Shopping", "Transportation", "Health", "Travel", "Services", "Other"]
//        let unitsSold = [20.00, 4.00, 6.00, 3.00, 12.00, 0.00, 1.0, 2.0, 0.0, 4.0]
//        setChart(dataPoints:months, values: unitsSold)
        fetch_data()
        pieChart.gestureRecognizers?[0].addTarget(self, action: #selector(action))
        
        }
    
    
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        dataEntries = []
        var legendEntries: [LegendEntry] = []
        var colors: [NSUIColor] = []
        if #available(iOS 13.0, *) {
            colors = [UIColor.systemGreen, UIColor.systemTeal, UIColor.systemBlue, UIColor.systemIndigo, UIColor.systemPurple, UIColor.systemPink.withAlphaComponent(0.8), UIColor.systemRed, UIColor.systemOrange, UIColor.systemYellow, UIColor.systemGray2]
        } else {
            // Fallback on earlier versions
            colors = [UIColor.systemGreen, UIColor.systemTeal, UIColor.systemBlue, UIColor.systemPurple, UIColor.systemPink.withAlphaComponent(0.8), UIColor.systemRed, UIColor.systemOrange, UIColor.systemYellow, UIColor.systemGray]
        }
        
        
        
        colors.append(contentsOf: ChartColorTemplates.joyful())
        
        var chartColors: [NSUIColor] = []
        
        for i in 0..<dataPoints.count {
            if values[i] != 0{
                chartColors.append(colors[i])
                cats.append(dataPoints[i])
                let dataEntry = PieChartDataEntry(value: Double(values[i]/bal), label: dataPoints[i])
                dataEntries.append(dataEntry)
                if highlighted {
                    if cats[Int(highlight)] == dataPoints[i] {
                        let legendEntry = LegendEntry(label: dataPoints[i]+String(format: ": $%.02f", values[i]), form: .circle, formSize: 25.0, formLineWidth: .nan, formLineDashPhase: .nan, formLineDashLengths: .none, formColor: colors[i])
                        legendEntries.append(legendEntry)
                    }
                }
                else {
                    let legendEntry = LegendEntry(label: dataPoints[i]+String(format: ": $%.02f", values[i]), form: .circle, formSize: 25.0, formLineWidth: .nan, formLineDashPhase: .nan, formLineDashLengths: .none, formColor: colors[i])
                    legendEntries.append(legendEntry)
                }
                
            }
        }
        print(categories)
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label:"")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier=100.0
        pieChartData.setValueFormatter(DefaultValueFormatter(formatter:formatter))
        pieChartDataSet.colors = chartColors
        
        
        pieChart.legend.enabled = true
        
        pieChart.legend.setCustom(entries: legendEntries)
        pieChart.legend.font = UIFont(name:"futura", size: 21)!
        pieChart.legend.orientation = .vertical
        pieChart.legend.verticalAlignment = .bottom
        pieChart.legend.horizontalAlignment = .center
        
        pieChart.rotationEnabled = false
        
        //pieChart.drawEntryLabelsEnabled = false
        
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
        
        APIClient.getTransactions(hash: UserDefaults.standard.string(forKey: "hashID")!, rows: "20"){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                //value is full array of dict from json
                for item in value
                {
                    self.transactions.append(TransData(trans_desc: item["trans_desc"]!, trans_amount: item["trans_amount"]!, trans_date: item["trans_date"]!, trans_balance: item["trans_balance"]!, trans_cat: item["cata"]!))
                    print(item)
                }
                //sleep(1)
                self.refreshControl?.endRefreshing()
                let prog = self.transactions[0].balance
                let amount = Double(prog)
                self.balance.text = String(format: "Available Balance: $%.02f", amount!)
                self.actualBalance.text = String(format: "Actual Balance: $%.02f", amount!)
                self.stockResultsFeed.reloadData()
            }
        }
    }
    
    
    @objc func action(){
        if pieChart.highlighted != [] {
            if tempTrans.isEmpty==false {
                transactions = tempTrans
                tempTrans = []
            }
            highlighted = true
            highlight = pieChart.highlighted[0].x
            setChart(dataPoints:categories, values: amounts)
            pieBottom.constant = 300
            stockResultsFeed.alpha = 1
            tableTop.constant = 440
            tableStack.alpha = 0
            tempTrans = transactions
            print(tempTrans)
            transactions = []
            let cata = cats[Int(highlight)].lowercased()
            print(cata)
            for t in tempTrans {
                print(t.cat)
                if t.cat == cata {
                    if t.amount[t.amount.startIndex]=="-"{
                        print(t)
                        transactions.append(t)
                    }
                }
            }
            stockResultsFeed.layoutIfNeeded()
            stockResultsFeed.reloadData()
            
        }
        else{
            highlighted = false
            pieBottom.constant = 0
            setChart(dataPoints:categories, values: amounts)
            stockResultsFeed.alpha = 0
            tableTop.constant = 13
            stockResultsFeed.layoutIfNeeded()
            refreshList()
            
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
        
        APIClient.getTransactions(hash: UserDefaults.standard.string(forKey: "hashID")!, rows: "20"){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                //value is full array of dict from json
                for item in value
                {
                    self.transactions.append(TransData(trans_desc: item["trans_desc"]!, trans_amount: item["trans_amount"]!, trans_date: item["trans_date"]!, trans_balance: item["trans_balance"]!, trans_cat: item["cata"]!))
    
                   
                    print(item)
                    
                    
                }
                Spinner.stop()
                let prog = self.transactions[0].balance
                let amount = Double(prog)
                self.balance.text = String(format: "Available Balance: $%.02f", amount!)
                self.actualBalance.text = String(format: "Actual Balance: $%.02f", amount!)
                self.stockResultsFeed.reloadData()
                
            }
            
            
        }
        
        APIClient.getBreakdown(hash: UserDefaults.standard.string(forKey: "hashID")!){result in
            switch result {
            case .failure(let error):
               print(error)
            case .success(let value):
                //value is full array of dict from json
                self.categories = ["Travel", "Restaurant", "Shopping", "Groceries", "Transportation", "Entertainment", "Health", "Other"]
                self.amounts = []
                var total = 0.0
                print(value)
                for item in value
                {
                    let amount = Double(item)
                    total += amount!
                    self.amounts.append(amount!)
                    

                }
                print(total)
                self.bal = total
                self.setChart(dataPoints:self.categories, values: self.amounts)
                

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
    

