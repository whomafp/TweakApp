//
//  NewsFeedViewController.swift
//  TweakApp
//  Created by Miguel Ángel Fonseca Pérez on 09/01/22.
//
import Foundation
import UIKit

class NewsFeedViewController : UIViewController{
    
    @IBOutlet weak var newsFeedTableView: UITableView!
    lazy var viewModel = FeedsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "News Feed"
        self.tabBarController?.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    private func setupPosts(){
        newsFeedTableView.dataSource = self
        newsFeedTableView.delegate = self
        newsFeedTableView.separatorStyle = .none
        newsFeedTableView.register(UINib(nibName: String(describing: FeedCell.self), bundle: .main), forCellReuseIdentifier: String(describing: FeedCell.self))
        newsFeedTableView.allowsSelection = false
        newsFeedTableView.rowHeight = UITableView.automaticDimension
        
    }
    
}
extension NewsFeedViewController :  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.newsFeedData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = self.viewModel.newsFeedData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedCell.self), for: indexPath) as! FeedCell
        cell.setupCellInfo(post: post)
        return cell
    }
    
}
