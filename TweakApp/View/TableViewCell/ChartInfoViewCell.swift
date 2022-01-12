//
//  ChartInfoViewCell.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 08/01/22.
//

import UIKit
import Charts

class ChartInfoViewCell: UITableViewCell, ChartViewDelegate, ReusableView, NibLoadableView {
    
    @IBOutlet weak var titleQuestion: UILabel!
    @IBOutlet weak var indicatorsCollection: UICollectionView!
    @IBOutlet weak var chartContainer: UIView!
    var chartIndicatorData: [ChartModel]?
    var colors: [String]?
    let indicatorReuseIdentifier = "indicatorIdentifier"
    let defaultHexColor = "#C4DEF6"
    let circleChart = PieChartView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollection()
        setupChartView()
    }
    
    private func setupChartView() {
        self.circleChart.delegate = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupChartInfo()
    }
    
    private func setupChartInfo() {
        circleChart.removeFromSuperview()
        circleChart.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        circleChart.center = chartContainer.center
        chartContainer.addSubview(circleChart)
        
        var entries = [ChartDataEntry]()
        var nscolors: [NSUIColor] = []
        
        guard let chartIndicatorData = chartIndicatorData else {
            return
        }

        for (index, item ) in chartIndicatorData.enumerated() {
            entries.append(ChartDataEntry(x: Double(index), y: Double(item.percetnage ?? 0), data: item.text ?? ""))
            let nscolor = NSUIColor(hexString: colors?[index] ?? defaultHexColor)
            nscolors.append(nscolor)
        }

        let set = PieChartDataSet(entries: entries)
        set.colors = nscolors
        let data = PieChartData(dataSet: set)
        circleChart.data = data
    }
    
    
    private func setupCollection() {
        
        indicatorsCollection.delegate = self
        indicatorsCollection.dataSource = self
        self.indicatorsCollection.register(UINib(nibName: String(describing: ChartIndicatorsCell.self), bundle: Bundle(for: ChartIndicatorsCell.self)), forCellWithReuseIdentifier: indicatorReuseIdentifier)
        self.indicatorsCollection.allowsSelection = false
        indicatorsCollection.isPagingEnabled = true
        indicatorsCollection.decelerationRate = UIScrollView.DecelerationRate(rawValue: 0.5)
        if let collectionViewLayout = indicatorsCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    func setupCellInfo(question: Question?) {
        self.titleQuestion.text = question?.text ?? "Unknown Question"
    }
    
    func fillInfoCollection(chartData: [ChartModel]?, colors: [String]?) {
        self.chartIndicatorData = chartData
        self.colors = colors
        self.indicatorsCollection.reloadData()
    }
}

extension ChartInfoViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let chartIndicatorData = chartIndicatorData else { return 0 }
        return chartIndicatorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indicatorReuseIdentifier, for: indexPath) as? ChartIndicatorsCell {
            let color = UIColor(hexString: self.colors?[indexPath.item] ?? defaultHexColor)
            cell.setupCellInfo(chartIndicator: chartIndicatorData?[indexPath.item], colorIndicator: color)
            return cell
        }
        return UICollectionViewCell()
    }
}
