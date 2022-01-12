//
//  ProfileViewController.swift
//  TweakApp
//  Created by Miguel Ángel Fonseca Pérez on 09/01/22.
//
import Foundation
import UIKit

class ProfileViewController : UIViewController {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var postsTableView: UITableView!
    lazy var viewModel = FeedsViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Profile"
        self.tabBarController?.navigationController?.navigationBar.sizeToFit()
    }
    
    
    private func setupUI() {
        profilePic.makeRounded()
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.register(UINib(nibName: String(describing: FeedCell.self), bundle: .main), forCellReuseIdentifier: String(describing: FeedCell.self))
        postsTableView.allowsSelection = false
        postsTableView.rowHeight = UITableView.automaticDimension
    }
    
}
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = self.viewModel.profileData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedCell.self), for: indexPath) as! FeedCell
        cell.setupCellInfo(post: post)
        return cell
    }
    
}
