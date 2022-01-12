//
//  ChatViewController.swift
//  TweakApp
//  Created by Miguel Ángel Fonseca Pérez on 09/01/22.
//
import Foundation
import UIKit

class ChatViewController : UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    lazy var viewModel = FeedsViewModel()
    
    //meter este metodo es correcto?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChatTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Chat"
        self.tabBarController?.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    private func setupChatTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.allowsSelection = false
        
    }
    
    
}

extension ChatViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.chatData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = self.viewModel.chatData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as! MessageTableViewCell
        cell.setupInfoCell(message: message)
        return cell
    }
    
    
}
