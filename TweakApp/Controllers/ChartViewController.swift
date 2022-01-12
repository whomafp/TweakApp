//
//  ChartViewController.swift
//  TweakApp
//  Created by Miguel Ángel Fonseca Pérez on 09/01/22.
//
import Foundation
import UIKit

class ChartViewController : UIViewController {
    lazy var viewModel = ChartManagerViewModel()
    @IBOutlet weak var chartTableView: UITableView!
    
    override func viewDidLoad() {
        setupViewModel()
        setupTableData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.fetchChartData()
    }
    
    private func setupTableData() {
        self.chartTableView.register(UINib(nibName: String(describing: ChartInfoViewCell.self), bundle: Bundle(for: ChartInfoViewCell.self)), forCellReuseIdentifier: String(describing: ChartInfoViewCell.self))
        self.chartTableView.delegate = self
        self.chartTableView.dataSource = self
        self.chartTableView.rowHeight = UITableView.automaticDimension
        self.chartTableView.allowsSelection = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Charts"
        self.tabBarController?.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
}

extension ChartViewController {
    private func setupViewModel() {
        viewModel.showLoading = {
            self.showSpinner(onView: self.view)
        }
        
        viewModel.removeLoading = {
            self.removeSpinner()
        }
        
        viewModel.didSetData = { [weak self] chartData in
            self?.chartTableView.reloadData()
        }
        
        viewModel.onFetchError = { error in
            debugPrint(error?.localizedDescription ?? "")
        }
        
    }
}

extension ChartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let info = self.viewModel.chartData else { return 0 }
        return info.questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChartInfoViewCell.self), for: indexPath) as? ChartInfoViewCell {
        cell.setupCellInfo(question: self.viewModel.getQuestionFromIndex(at: indexPath.item))
        cell.fillInfoCollection(chartData: self.viewModel.getQuestionFromIndex(at: indexPath.item)?.chartData, colors: self.viewModel.chartData?.colors)
        return cell
        }
        
        return UITableViewCell()
    }
    
    
}
