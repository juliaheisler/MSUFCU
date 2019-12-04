//
//  NotificationVC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/15/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

//Notification page

class NotificationVC: UIViewController {
    
    var notifications: [String] = []


    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        
        fetch_data()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //fetch_data()
        print("refresh")
    }
    
    // fetch notifications
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
                    let notifs = item
                    var lines = notifs.split { $0.isNewline }
                    lines.remove(at: lines.count-1)
                    lines.remove(at: 0)
                    print(lines)
                    for l in lines
                    {
                        self.notifications.append(String(l))
                    }
                    
                }
            }
            self.tableView.reloadData()


        }
    }
    
    
}

//Populate Notification Table
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



