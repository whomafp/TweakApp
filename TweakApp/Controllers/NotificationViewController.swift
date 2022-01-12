//
//  NewsFeedViewController.swift
//  TweakApp
//  Created by Miguel Ángel Fonseca Pérez on 09/01/22.
//
import Foundation
import UIKit

class NotificationViewController : UIViewController {
    
    @IBOutlet weak var notificationTableView: UITableView!
    
    lazy var viewModel = FeedsViewModel()
    
    
    // es correcto meter este?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotifications()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Notifications"
        self.tabBarController?.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    private func setupNotifications() {
        notificationTableView.dataSource = self
        notificationTableView.delegate = self
        notificationTableView.allowsSelection = false
    }
}

extension NotificationViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.notificationData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notification = self.viewModel.notificationData[indexPath.row]
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: "notificationCell", for : indexPath) as! NotificationTableViewCell
        cell.notificationLabel.text = notification.body
        cell.notificationImage.image = UIImage(named: notification.imageName)
        cell.notificationImage.makeRounded()
        return cell
    }
    
    
}
