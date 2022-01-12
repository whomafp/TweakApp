//
//  ChartIndicatorsCell.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 08/01/22.
//

import UIKit

class ChartIndicatorsCell: UICollectionViewCell {
    
    @IBOutlet weak var colorIndicator: UIView!
    @IBOutlet weak var descIndicator: UILabel!
    @IBOutlet weak var percentageIndicator: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.colorIndicator.makeRounded()
    }
    
    func setupCellInfo(chartIndicator: ChartModel?, colorIndicator: UIColor) {
        guard let chartIndicator = chartIndicator else { return }
        self.colorIndicator.backgroundColor = colorIndicator
        self.descIndicator.text = chartIndicator.text ?? "Unknown"
        self.percentageIndicator.text = "\(chartIndicator.percetnage ?? 0) %"
    }
    
}
