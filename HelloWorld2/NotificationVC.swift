//
//  NotificationVC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/15/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {
    
    var notifications: [String] = []


    

    @IBOutlet weak var tableView: UITableView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        
        fetch_data()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //fetch_data()
        print("refresh")
    }
    
    func fetch_data()
    {
        self.notifications = []

        APIClient.getNotifications(hash: UserDefaults.standard.string(forKey: "hashID")!){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                //value is full array of dict from json
                for item in value
                {
                    print(item)
                    self.notifications.append(item)
                }
            }
            self.tableView.reloadData()


        }
    }
    
    
}

extension NotificationVC: UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print(transactions.count)
        return notifications.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notif = notifications[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell") as! NotificationCell
        
        cell.setNotif(notification: notif)
        
        return cell
        
        
        
    }
}



